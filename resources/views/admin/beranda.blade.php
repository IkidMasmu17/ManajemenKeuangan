@extends('layouts.layoutadmin1')

@section('title', 'Dashboard')
@section('halaman', 'Overview')

@section('container')

  <div class="row mb-4">
    <div class="col-12">
      <h2 class="dashboard-title">Dashboard</h2>
      <p class="dashboard-subtitle">Selamat datang kembali, {{ Auth::user()->name }}!</p>
    </div>
  </div>

  <div class="row">
    <!-- Card 1: Total Pemasukan -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="card-modern">
        <div class="stat-icon-wrapper bg-icon-dark">
          <i class="fas fa-wallet"></i>
        </div>
        <div class="stat-label">Total Pemasukan</div>
        <div class="stat-value">@currency($totalpemasukan)</div>
        <div class="stat-meta meta-success">
          <i class="fas fa-arrow-up"></i> Income
        </div>
      </div>
    </div>

    <!-- Card 2: Total Pengeluaran -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="card-modern">
        <div class="stat-icon-wrapper bg-icon-light">
          <i class="fas fa-shopping-cart"></i>
        </div>
        <div class="stat-label">Total Pengeluaran</div>
        <div class="stat-value">@currency($totalpengeluaran)</div>
        <div class="stat-meta meta-neutral">
          - Expenses
        </div>
      </div>
    </div>

    <!-- Card 3: Saldo / Balance -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="card-modern">
        <div class="stat-icon-wrapper bg-icon-dark">
          <i class="fas fa-coins"></i>
        </div>
        <div class="stat-label">Saldo Saat Ini</div>
        <div class="stat-value">@currency($sisasaldo)</div>
        <div class="stat-meta meta-success">
          + Balance
        </div>
      </div>
    </div>

    <!-- Card 4: Total Siswa -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="card-modern">
        <div class="stat-icon-wrapper bg-icon-light">
          <i class="fas fa-users"></i>
        </div>
        <div class="stat-label">Total Siswa</div>
        <div class="stat-value">{{ $siswa }}</div>
        <div class="stat-meta meta-neutral">
          Active Users
        </div>
      </div>
    </div>
  </div>

  <div class="row mt-4">
    <!-- Chart Section -->
    <div class="col-12 col-lg-8">
      <div class="card-modern">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <div class="widget-title">Ringkasan Keuangan</div>
          <select class="custom-select custom-select-sm" style="width: auto;">
            <option>Tahun Ini</option>
          </select>
        </div>
        <div style="height: 300px; width: 100%;">
          <canvas id="financeChart"></canvas>
        </div>
      </div>
    </div>

    <!-- Right Side Widgets -->
    <div class="col-12 col-lg-4">
      <div class="card-modern">
        <div class="widget-title">Status Pembayaran</div>
        <div style="height: 200px; width: 100%; position: relative;">
          <canvas id="paymentStatusChart"></canvas>
        </div>
        <div class="mt-4">
          <div class="expense-item">
            <div class="stat-icon-wrapper bg-icon-light mb-0" style="width: 40px; height: 40px; font-size: 16px;">
              <i class="fas fa-check"></i>
            </div>
            <div class="expense-info">
              <div class="expense-name">Lunas</div>
              <div class="text-muted small">{{ $lunas }} Siswa</div>
            </div>
            <div class="expense-amount text-success">
              {{ round(($lunas / ($lunas + $belumlunas > 0 ? $lunas + $belumlunas : 1)) * 100) }}%</div>
          </div>
          <div class="expense-item">
            <div class="stat-icon-wrapper bg-icon-light mb-0" style="width: 40px; height: 40px; font-size: 16px;">
              <i class="fas fa-times"></i>
            </div>
            <div class="expense-info">
              <div class="expense-name">Belum Lunas</div>
              <div class="text-muted small">{{ $belumlunas }} Siswa</div>
            </div>
            <div class="expense-amount text-danger">
              {{ round(($belumlunas / ($lunas + $belumlunas > 0 ? $lunas + $belumlunas : 1)) * 100) }}%</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Quick Links / Shortcuts from Original -->
  @if(Auth::user()->tipeuser === 'admin')
    <div class="row mt-4">
      <div class="col-12">
        <div class="card-modern">
          <div class="widget-title">Akses Cepat</div>
          <div class="row">
            <div class="col-md-3 mb-3">
              <a href="{{ route('kategori') }}" class="btn btn-block btn-lg btn-light py-4">
                <i class="fab fa-korvue fa-2x mb-2 text-dark"></i>
                <br> <span class="text-dark font-weight-bold">Kategori</span>
              </a>
            </div>
            <div class="col-md-3 mb-3">
              <a href="{{ route('siswa') }}" class="btn btn-block btn-lg btn-light py-4">
                <i class="fas fa-user-graduate fa-2x mb-2 text-dark"></i>
                <br> <span class="text-dark font-weight-bold">Siswa</span>
              </a>
            </div>
            <div class="col-md-3 mb-3">
              <a href="{{ route('pemasukan') }}" class="btn btn-block btn-lg btn-light py-4">
                <i class="fas fa-hand-holding-usd fa-2x mb-2 text-dark"></i>
                <br> <span class="text-dark font-weight-bold">Pemasukan</span>
              </a>
            </div>
            <div class="col-md-3 mb-3">
              <a href="{{ route('pembayaran') }}" class="btn btn-block btn-lg btn-light py-4">
                <i class="far fa-money-bill-alt fa-2x mb-2 text-dark"></i>
                <br> <span class="text-dark font-weight-bold">Pembayaran</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  @endif

@endsection

@section('jshere')
  <script>
    // Chart configurations
    document.addEventListener("DOMContentLoaded", function () {
      // Finance Bar Chart
      var ctx = document.getElementById('financeChart').getContext('2d');
      var financeChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Dana BOS', 'Pembayaran Siswa', 'Lainnya'],
          datasets: [{
            label: 'Pemasukan',
            data: [{{ $sumpemasukanbos }}, {{ $sumtagihansiswa }}, {{ $sumpemasukan }}],
            backgroundColor: '#1a202c',
            borderRadius: 4
          }, {
            label: 'Pengeluaran',
            data: [{{ $sumpengeluaranbos }}, 0, {{ $sumpengeluaran }}],
            backgroundColor: '#cbd5e0',
            borderRadius: 4
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true,
              grid: { borderDash: [2, 4], color: '#edf2f7', drawBorder: false }
            },
            x: {
              grid: { display: false }
            }
          },
          plugins: {
            legend: {
              position: 'top',
              align: 'end',
              labels: { usePointStyle: true, boxWidth: 8 }
            }
          }
        }
      });

      // Payment Status Donut Chart
      var ctx2 = document.getElementById('paymentStatusChart').getContext('2d');
      var paymentStatusChart = new Chart(ctx2, {
        type: 'doughnut',
        data: {
          labels: ['Lunas', 'Belum Lunas'],
          datasets: [{
            data: [{{ $lunas }}, {{ $belumlunas }}],
            backgroundColor: ['#1a202c', '#edf2f7'],
            borderWidth: 0
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          cutout: '75%',
          plugins: {
            legend: { display: false }
          }
        }
      });
    });
  </script>
@endsection