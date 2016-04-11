SRC_DIR:=./vlfeat/vl/
SRCs:=$(SRC_DIR)/dsift.c $(SRC_DIR)/lbp.c $(SRC_DIR)/generic.c $(SRC_DIR)/host.c $(SRC_DIR)/random.c $(SRC_DIR)/mathop.c $(SRC_DIR)/imopv.c $(SRC_DIR)/imopv_sse2.c $(SRC_DIR)/mathop_sse2.c $(SRC_DIR)/sift.c $(SRC_DIR)/gmm.c $(SRC_DIR)/kmeans.c $(SRC_DIR)/kdtree.c $(SRC_DIR)/fisher.c $(SRC_DIR)/vlad.c $(SRC_DIR)/liop.c
OBJs:=$(patsubst $(SRC_DIR)/%.c,%.o,$(SRCs))

libvl.so: $(OBJs)
	gcc -fPIC -shared $(OBJs) -o $@
$(OBJs): $(SRCs)
	gcc -fPIC -O3 -DVL_DISABLE_AVX -c $(SRCs) -I$(SRC_DIR)/
clean: libvl.so
	rm -f $^
	rm -f $(OBJs)
test: 
