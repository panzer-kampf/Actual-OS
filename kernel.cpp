void printf(char* str)
{
	unsigned short* vidmem = (unsigned short*)0xb8000;

	for(int i = 0; str[i] != '/0'; ++i)
		vidmem[i] = (vidmem[i] & 0xFF00) |  str[i];
}





extern "C" void kernelmain(void* multiboot_struc, unsigned int numbah)
{
	printf("wussup");

	while(1);
}
