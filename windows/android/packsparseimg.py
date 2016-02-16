# -*- coding: cp936 -*-

import xml.etree.ElementTree as et

def load_xml_file(fileName):
    root = et.parse(fileName).getroot()
    start_sector = 0
    system = open(r'C:\test\system.img',"wb+")
    for child in root:
        if child.attrib["label"] == "system":
            id = child.attrib["filename"].split("_")[1].split(".")[0]
            if id == "1":
                start_sector= child.attrib["start_sector"]
            length = int(child.attrib["num_partition_sectors"]) * int(child.attrib["SECTOR_SIZE_IN_BYTES"])
            start_pos = (int(child.attrib["start_sector"]) - int(start_sector)) * int(child.attrib["SECTOR_SIZE_IN_BYTES"])
            system.seek(start_pos,0)
            filename = "\\"+child.attrib["filename"]
            file_to_write = open (r'C:\test'+filename,"rb")
            buff = file_to_write.read()
            file_to_write.close()
            system.write(buff)
            print "system image id "+id+" positions is "+ str(start_pos)+" and length is "+str(length)+ " has wrote"
    patch = 128*1024*1024
    last_pos = patch + start_pos + length
    system.seek(last_pos-1,0)
    system.write(b"\x00")
    system.flush()
    system.close()

if __name__ == '__main__':

    load_xml_file(r'C:\test\rawprogram_unsparse.xml')
