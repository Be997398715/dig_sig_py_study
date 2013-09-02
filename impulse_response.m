%impulse response analyse
input=zeros(1,1024);
input(1)=hex2dec('7FFF');
% Int16 coeff_fir_96_1k_3k[COEF_96] = {
% 	0x0000, 0x0000, 0xffff, 0xfffe, 0xfffd, 0xfffe, 0x0002, 0x000b, 
% 	0x0018, 0x0029, 0x003d, 0x0051, 0x0061, 0x0069, 0x0066, 0x0056,
% 	0x003a, 0x0014, 0xffec, 0xffc7, 0xffaf, 0xffaa, 0xffbc, 0xffe5,
% 	0x001e, 0x005d, 0x0092, 0x00aa, 0x0094, 0x0042, 0xffad, 0xfed6, 
% 	0xfdcb, 0xfca5, 0xfb83, 0xfa8d, 0xf9eb, 0xf9c0, 0xfa26, 0xfb27, 
% 	0xfcbe, 0xfed3, 0x013c, 0x03c5, 0x0630, 0x0842, 0x09c5, 0x0a91, 
% 	0x0a91, 0x09c5, 0x0842, 0x0630, 0x03c5, 0x013c, 0xfed3, 0xfcbe, 
% 	0xfb27, 0xfa26, 0xf9c0, 0xf9eb, 0xfa8d, 0xfb83, 0xfca5, 0xfdcb, 
% 	0xfed6, 0xffad, 0x0042, 0x0094, 0x00aa, 0x0092, 0x005d, 0x001e,
% 	0xffe5, 0xffbc, 0xffaa, 0xffaf, 0xffc7, 0xffec, 0x0014, 0x003a,
% 	0x0056, 0x0066, 0x0069, 0x0061, 0x0051, 0x003d, 0x0029, 0x0018,
% 	0x000b, 0x0002, 0xfffe, 0xfffd, 0xfffe, 0xffff, 0x0000, 0x0000
% };
coeff = [
	hex2dec('0000') hex2dec('0000') hex2dec('ffff') hex2dec('fffe') hex2dec('fffd') hex2dec('fffe') hex2dec('0002') hex2dec('000b') 
	hex2dec('0018') hex2dec('0029') hex2dec('003d') hex2dec('0051') hex2dec('0061') hex2dec('0069') hex2dec('0066') hex2dec('0056')
	hex2dec('003a') hex2dec('0014') hex2dec('ffec') hex2dec('ffc7') hex2dec('ffaf') hex2dec('ffaa') hex2dec('ffbc') hex2dec('ffe5')
	hex2dec('001e') hex2dec('005d') hex2dec('0092') hex2dec('00aa') hex2dec('0094') hex2dec('0042') hex2dec('ffad') hex2dec('fed6') 
	hex2dec('fdcb') hex2dec('fca5') hex2dec('fb83') hex2dec('fa8d') hex2dec('f9eb') hex2dec('f9c0') hex2dec('fa26') hex2dec('fb27') 
	hex2dec('fcbe') hex2dec('fed3') hex2dec('013c') hex2dec('03c5') hex2dec('0630') hex2dec('0842') hex2dec('09c5') hex2dec('0a91') 
	hex2dec('0a91') hex2dec('09c5') hex2dec('0842') hex2dec('0630') hex2dec('03c5') hex2dec('013c') hex2dec('fed3') hex2dec('fcbe') 
	hex2dec('fb27') hex2dec('fa26') hex2dec('f9c0') hex2dec('f9eb') hex2dec('fa8d') hex2dec('fb83') hex2dec('fca5') hex2dec('fdcb') 
	hex2dec('fed6') hex2dec('ffad') hex2dec('0042') hex2dec('0094') hex2dec('00aa') hex2dec('0092') hex2dec('005d') hex2dec('001e')
	hex2dec('ffe5') hex2dec('ffbc') hex2dec('ffaa') hex2dec('ffaf') hex2dec('ffc7') hex2dec('ffec') hex2dec('0014') hex2dec('003a')
	hex2dec('0056') hex2dec('0066') hex2dec('0069') hex2dec('0061') hex2dec('0051') hex2dec('003d') hex2dec('0029') hex2dec('0018')
	hex2dec('000b') hex2dec('0002') hex2dec('fffe') hex2dec('fffd') hex2dec('fffe') hex2dec('ffff') hex2dec('0000') hex2dec('0000')
	]
coeff=reshape(coeff',1,numel(coeff))
coeff16=typecast(uint16(coeff),'int16')
coeffd=double(coeff16)

%display filter fr and phase
%freqz(coeffd)
total_axis = 2
axis = 1
fs=44100

subplot(1,total_axis,axis),plot(coeffd),title('coeff org')
axis=axis+1

coeff_fft = abs(fft(coeffd))
%subplot(3,1,2),plot(coeff_fft),title('coeff fft')

freq_div=[1:numel(coeff)/2+1]
freq_div=(fs/2)/(numel(coeff)/2+1).*freq_div
subplot(1,total_axis,axis),plot(freq_div,coeff_fft(1:numel(coeff)/2+1)),title('coeff real fft')
