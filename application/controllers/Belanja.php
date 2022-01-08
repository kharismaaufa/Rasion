<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Belanja extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('m_transaksi');
    }

    public function index(){
        if (empty($this->cart->contents())){
            redirect('home');
        }
        $data = array(
            'title' => 'Keranjang Belanja',
            'isi' => 'v_belanja',
        );
        $this->load->view('layout/v_wrapper_frontend', $data, FALSE);
    }

    public function add(){
        $redirect_page = $this->input->post('redirect_page');
        $data = array(
            'id'     => $this->input->post('id'),
            'qty'    => $this->input->post('qty'),
            'price'  => $this->input->post('price'),
            'name'   => $this->input->post('name'),
        );
        $this->cart->insert($data);
        redirect($redirect_page, 'refresh');
    }

    public function delete($rowid){
        $this->cart->remove($rowid);
        redirect('belanja');
    }

    public function update(){
        $i = 1;
        foreach ($this->cart->contents() as $items){
            $data = array(
                'rowid' => $items['rowid'],
                'qty'   => $this->input->post($i.'[qty]'),
            );
            $this->cart->update($data);
            $i++;
        }
        redirect('belanja');
    }

    public function clear(){
        $this->cart->destroy();
        redirect('belanja');
    }

    public function checkout(){
        $this->pelanggan_login->proteksi_halaman();
        $this->form_validation->set_rules('nama_penerima', 'Nama Penerima', 'required', array(
            'required' => '%s Harus Diisi...!!!'
        ));
        $this->form_validation->set_rules('alamat_penerima', 'Alamat Penerima', 'required', array(
            'required' => '%s Harus Diisi...!!!'
        ));
        $this->form_validation->set_rules('tlp_penerima', 'Telepon Penerima', 'required', array(
            'required' => '%s Harus Diisi...!!!'
        ));

        if ($this->form_validation->run() == FALSE){
            $data = array(
                'title' => 'Check Out Belanja',
                'isi' => 'v_checkout',
            );
            $this->load->view('layout/v_wrapper_frontend', $data, FALSE);
        }else{
            $data = array(
                'no_order' => $this->input->post('no_order'),
                'tgl_order' => date('Y-m-d'),
                'nama_penerima' => $this->input->post('nama_penerima'),
                'alamat_penerima' => $this->input->post('alamat_penerima'),
                'tlp_penerima' => $this->input->post('tlp_penerima'),
                'total_bayar' => $this->input->post('total_bayar'),
            );
            $this->m_transaksi->simpan_transaksi($data);
            $this->session->set_flashdata('pesan', 'Pesanan berhasil di Proses!!!');
            redirect('pesanan_saya');
        }
    }
}