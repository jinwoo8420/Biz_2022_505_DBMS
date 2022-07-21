SELECT 3,4,5,6,7 FROM DUAL
UNION ALL
SELECT 5,6,7,9,9 FROM DUAL
UNION ALL
SELECT 10,11,12,13,14 FROM DUAL;

INSERT INTO tbl_images(i_seq, i_bseq, i_originalName, i_imageName)
SELECT seq_image.NEXTVAL, SUB. * FROM
(
    SELECT 1,'image1.jpg','udd-image1.jpg' FROM DUAL
    UNION ALL
    SELECT 1,'image2.jpg','udd-image2.jpg' FROM DUAL
    UNION ALL
    SELECT 1,'image3.jpg','udd-image3.jpg' FROM DUAL
) SUB;