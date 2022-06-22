#include <cstdio>
int check_parity(unsigned int n) 
{
    int b;
    //Left Shifting by double of previous operation shift
    //And take xor with the previous result.
    b = n ^ (n >> 1); 
    b = b ^ (b >> 2); 
    b = b ^ (b >> 4); 
    b = b ^ (b >> 8); 
    b = b ^ (b >> 16); 
    //Now b contain the parity value
    //If b is odd mean odd parity else even parity
    if (b & 1) //This is used for checking odd
        return 1; 
    else      
        return 0; 
}

int generateHeader(unsigned int col, unsigned int row, unsigned int pktType, unsigned int ID){
    int header=0;
    header |= ID;
    header |= pktType<<12;
    header |= row<<16;
    header |= col<<21;
    if(check_parity(header)==0){
      header |= 1<<31;
    }
    return header;
}

int main(){
    int header1=generateHeader(7,1,4,0xc);
    printf("Header1: %x\n",header1); 
}
