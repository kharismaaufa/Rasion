 <!-- Main content -->
 <div class="invoice p-3 mb-3">
    <!-- title row -->
    <div class="row">
        <div class="col-12">
            <h4>
            <i class="fas fa-coffee"></i> Coffein, CoffeShop
            <small class="float-right">Tanggal : <?php echo date("d/m/Y - H:i:s") ?></small>
            </h4>
        </div>
        <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
            Dari
            <address>
            <strong>Coffein, CoffeShop</strong><br>
            Jl. Sadewa 1 No. 46 B-C-D<br>
            Kota Semarang, 50517<br>
            Telepon: (+62)896 7771 4900<br>
            E-mail: Coffeincoffeshop@gmail.com
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
        
        </div>
        <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- Table row -->
        <div class="row">
        <div class="col-12 table-responsive">
            <table class="table table-striped">
            <thead>
            <tr>
                <th>Qty</th>
                <th>Produk</th>
                <th class="text-center">Harga</th>
                <th class="text-center">Total Harga</th>
            </tr>
            </thead>
            <tbody>
            <?php
                $i = 1;
                foreach ($this->cart->contents() as $items) {?>
            <tr>
                <td><?php echo $items['qty']; ?></td>
                <td><?php echo $items['name']; ?></td>
                <td style="text-align:center">Rp <?php echo number_format($items['price'], 0); ?></td>
                <td style="text-align:center">Rp <?php echo number_format($items['subtotal'], 0); ?></td>
            </tr>
                <?php } ?>
            </tbody>
            </table>
        </div>
        <!-- /.col -->
        </div>
        <!-- /.row -->
        

        <?php 
            echo form_open('belanja/checkout');
            $no_order = date('Ymd') . strtoupper(random_string('alnum', 8));
            $total_bayar = $this->cart->total();
        ?>
        
        <div class="row">
        <!-- accepted payments column -->
            <div class="col-8">
                <div class="col-sm-8">    
                    <div class="form-group">
                        <label>Nama Penerima</label>
                        <input type="text" name="nama_penerima" class="form-control">
                    </div>
                </div>
                <div class="col-sm-8">    
                    <div class="form-group">
                        <label>Alamat Penerima</label>
                        <input type="text" name="alamat_penerima" class="form-control">
                    </div>
                </div>
                <div class="col-sm-8">    
                    <div class="form-group">
                        <label>Telepon Penerima</label>
                        <input type="text" name="tlp_penerima" class="form-control">
                    </div>
                </div>
            </div>         
        <!-- /.col -->
            <div class="col-4">
                <div class="table-responsive">
                <table class="table">
                    <tr>
                    <th style="width:50%">Subtotal:</th>
                    <td>Rp <?php echo number_format($this->cart->total(), 0); ?></td>
                    </tr>
                    <tr>
                    <th>Ongkos Kirim</th>
                    <td><strong>Gratis</strong></td>
                    </tr>
                    <tr>
                    <th>Total:</th>
                    <td id="total_bayar">Rp <?php echo number_format($this->cart->total(), 0); ?></td>
                    </tr>
                </table>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- this row will not appear when printing -->
        <div class="row no-print">
        <div class="col-12">
            <a href="<?= base_url('belanja')?>" class="btn btn-warning"><i class="fas fa-arrow-left"></i> Kembali ke Keranjang</a>
            <button type="submit" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Proses Checkout</button>
        </div>
    </div>
    <?php  echo form_close(); ?>
</div>