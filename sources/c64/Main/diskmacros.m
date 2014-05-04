macro open_file d_start {

	movew d_start,start_tracksector
	jsr d_open_file
}

macro seek_byte record {

	movew record,file_offset
	jsr d_seek_record
}

macro read_segment buff,numbytes {

	movew buff,put_address+1
	movew numbytes,number_of_bytes
	jsr d_read_segment

}

macro write_segment buff,numbytes {
    
	movew buff,buffer_pointer
	movew numbytes,number_of_bytes
	jsr d_write_segment

}

macro read_byte dest {

	jsr d_read_byte
	mif (IsAregister(dest)) {

	    } melseif(IsXregister(dest)) {
	        tax
	    } melseif(IsYregister(dest)) {
	        tay
	    } melse {
	        sta dest
	    }
}

macro close_file {
}  

