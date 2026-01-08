@extends('layouts.layoutadmin1')

@section('title', 'Tahun Pelajaran')
@section('halaman', 'Tahun Pelajaran')

@section('csshere')
@endsection

@section('jshere')
@endsection

@section('notif')
  @if (session('tipe'))
    @php
      $tipe = session('tipe');    
    @endphp
  @else
    @php
      $tipe = 'light';
    @endphp
  @endif

  @if (session('icon'))
    @php
      $icon = session('icon');    
    @endphp
  @else
    @php
      $icon = 'far fa-lightbulb';
    @endphp
  @endif

  @if (session('status'))
    <div class="alert alert-{{ $tipe }} alert-has-icon alert-dismissible show fade">
      <div class="alert-icon"><i class="{{ $icon }}"></i></div>
      <div class="alert-body">
        <div class="alert-title">{{ Str::ucfirst($tipe) }}</div>
        <button class="close" data-dismiss="alert">
          <span>&times;</span>
        </button>
        {{ session('status') }}
      </div>
    </div>
  @endif
@endsection

@section('container')
  <div class="section-body">
    <div class="row">
      <!-- Form Tambah Tapel -->
      <div class="col-12 mb-4">
        <div class="card-modern">
          <div class="widget-title">
            <i class="fas fa-plus-circle mr-2"></i> Tambah Tahun Pelajaran
          </div>
          <form action="/admin/{{ $pages }}" method="post">
            @csrf
            <div class="row">
              <div class="col-12 form-group mb-4">
                <label class="form-label" for="nama">Tahun Pelajaran</label>
                <input type="text" name="nama" id="nama" class="custom-input @error('nama') is-invalid @enderror"
                  value="{{old('nama')}}" required placeholder="Contoh: 2023/2024">
                @error('nama')<div class="invalid-feedback"> {{$message}}</div>@enderror
              </div>
            </div>

            <div class="text-right">
              <button class="btn btn-dark px-4 py-2" style="background-color: #1a202c; border-radius: 8px;">
                <i class="fas fa-save mr-1"></i> Simpan
              </button>
            </div>
          </form>
        </div>
      </div>

      <!-- Tabel Data Tapel -->
      <div class="col-12">
        <div class="card-modern">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <div class="widget-title mb-0">
              <i class="fas fa-list mr-2"></i> Daftar Tahun Pelajaran
            </div>
            <div class="text-muted small">
              Total: {{ $jmldata }} Data
            </div>
          </div>

          <div class="table-responsive">
            <table class="table table-hover table-borderless">
              <thead style="background-color: #f7fafc; border-bottom: 2px solid #edf2f7;">
                <tr>
                  <th class="py-3 px-4 text-secondary font-weight-bold ml-2">#</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold">Tahun Pelajaran</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold text-center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($datas as $data)
                  <tr style="border-bottom: 1px solid #edf2f7;">
                    <td class="py-3 px-4">{{ ((($loop->index) + 1) + (($datas->currentPage() - 1) * $datas->perPage())) }}</td>
                    <td class="py-3 px-4 font-weight-600 text-dark">{{ $data->nama }}</td>
                    <td class="py-3 px-4 text-center">
                      <a href="/admin/{{ $pages }}/{{$data->id}}" class="btn btn-sm btn-icon btn-light mr-1"
                        data-toggle="tooltip" title="Edit">
                        <i class="fas fa-edit text-warning"></i>
                      </a>
                      <form action="/admin/{{ $pages }}/{{$data->id}}" method="post" class="d-inline">
                        @method('delete')
                        @csrf
                        <button class="btn btn-sm btn-icon btn-light"
                          onclick="return confirm('Anda yakin menghapus data ini?')" data-toggle="tooltip" title="Hapus">
                          <i class="fas fa-trash text-danger"></i>
                        </button>
                      </form>
                    </td>
                  </tr>
                @endforeach
              </tbody>
            </table>
          </div>

          <div class="d-flex justify-content-end mt-4">
            {{ $datas->links() }}
          </div>

        </div>
      </div>
    </div>
  </div>
@endsection