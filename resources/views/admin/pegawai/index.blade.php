@extends('layouts.layoutadmin1')

@section('title', 'Pegawai')
@section('halaman', 'Pegawai')

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

  @php
    $message = session('status');
  @endphp
  @if (session('status'))
    <x-alert tipe="{{ $tipe }}" message="{{ $message }}" icon="{{ $icon }}" />
  @endif
@endsection

@section('container')
  <div class="section-body">
    <div class="row">
      <!-- Form Tambah Pegawai -->
      <div class="col-12 mb-4">
        <div class="card-modern" id="add">
          <div class="widget-title">
            <i class="fas fa-plus-circle mr-2"></i> Tambah Pegawai
          </div>
          <form action="/admin/{{ $pages }}" method="post">
            @csrf
            <!-- Row 1 -->
            <div class="row">
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">Nomor Induk Pegawai (NIG)</label>
                <input type="number" name="nig" class="custom-input @error('nig') is-invalid @enderror"
                  value="{{old('nig')}}" required placeholder="Nomor Induk Guru/Pegawai">
                @error('nig')<div class="invalid-feedback"> {{$message}}</div>@enderror
              </div>
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">Nama Lengkap</label>
                <input type="text" name="nama" class="custom-input @error('nama') is-invalid @enderror"
                  value="{{old('nama')}}" required placeholder="Nama Lengkap">
                @error('nama')<div class="invalid-feedback"> {{$message}}</div>@enderror
              </div>
            </div>

            <!-- Row 2 -->
            <div class="row">
              <div class="col-12 form-group mb-3">
                <label class="form-label">Alamat</label>
                <input type="text" name="alamat" class="custom-input @error('alamat') is-invalid @enderror"
                  value="{{old('alamat')}}" required>
              </div>
            </div>

            <!-- Row 3 -->
            <div class="row">
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">No. HP</label>
                <input type="text" name="telp" class="custom-input @error('telp') is-invalid @enderror"
                  value="{{old('telp')}}" required>
              </div>
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">Jabatan (Kategori)</label>
                <input type="text" name="kategori_nama" class="custom-input @error('kategori_nama') is-invalid @enderror"
                  value="{{old('kategori_nama')}}" required placeholder="Contoh: Guru / Staff">
              </div>
            </div>

            <!-- Row 4 -->
            <div class="row">
              <div class="col-12 form-group mb-3">
                <label class="form-label">Email (Login)</label>
                <input type="email" name="email" class="custom-input @error('email') is-invalid @enderror"
                  value="{{old('email')}}" onblur="duplicateEmail(this)" required>
              </div>
            </div>

            <!-- Row 5 -->
            <div class="row">
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="custom-input @error('password') is-invalid @enderror"
                  required>
              </div>
              <div class="col-md-6 form-group mb-3">
                <label class="form-label">Konfirmasi Password</label>
                <input type="password" name="password2" class="custom-input @error('password2') is-invalid @enderror"
                  required>
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

      <!-- Tabel & Filter Data Pegawai -->
      <div class="col-12">
        <div class="card-modern">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <div class="widget-title mb-0">
              <i class="fas fa-list mr-2"></i> Daftar Pegawai
            </div>
            <div class="text-muted small">
              Total: {{ $jmldata }} Data
            </div>
          </div>

          <!-- Bagian Filter -->
          <form action="{{ route('pegawai.cari') }}" method="GET" class="mb-4 p-3 bg-light rounded">
            <div class="row">
              <div class="col-md-4 mb-2">
                <input type="text" name="cari" class="form-control" value="{{$request->cari}}"
                  placeholder="Cari Nama Pegawai...">
              </div>
              <div class="col-md-3 mb-2">
                <select class="form-control" name="kategori_nama">
                  <option value="">Semua Jabatan</option>
                  @foreach ($kategori as $t)
                    <option @if($request->kategori_nama == $t->nama) selected @endif>{{ $t->nama }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-md-2 mb-2">
                <button type="submit" class="btn btn-info btn-block"><i class="fas fa-search"></i> Cari</button>
              </div>
            </div>
          </form>

          <div class="table-responsive">
            <table class="table table-hover table-borderless">
              <thead style="background-color: #f7fafc; border-bottom: 2px solid #edf2f7;">
                <tr>
                  <th class="py-3 px-4 text-secondary font-weight-bold ml-2">#</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold">Nama</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold">Jabatan</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold">Email</th>
                  <th class="py-3 px-4 text-secondary font-weight-bold text-center">Aksi</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($datas as $data)
                  <tr style="border-bottom: 1px solid #edf2f7;">
                    <td class="py-3 px-4">{{ ((($loop->index) + 1) + (($datas->currentPage() - 1) * $datas->perPage())) }}
                    </td>
                    <td class="py-3 px-4 font-weight-600 text-dark">{{ $data->nama }}</td>
                    <td class="py-3 px-4">
                      <span class="badge badge-light text-dark">{{ $data->kategori_nama }}</span>
                    </td>
                    <td class="py-3 px-4">
                      @php
                        $ambilemail = DB::table('users')->where('nomerinduk', '=', $data->nig)->first();
                        $email = $ambilemail ? $ambilemail->email : '-';
                      @endphp
                      {{ $email }}
                    </td>
                    <td class="py-3 px-4 text-center">
                      <a href="/admin/{{ $pages }}/{{$data->id}}" class="btn btn-sm btn-icon btn-light mr-1"
                        data-toggle="tooltip" title="Edit">
                        <i class="fas fa-edit text-warning"></i>
                      </a>
                      <x-button-delete link="/admin/{{ $pages }}/{{$data->id}}" />
                    </td>
                  </tr>
                @endforeach
              </tbody>
            </table>
          </div>

          <div class="d-flex justify-content-end mt-4">
            @php
              $cari = $request->cari;
              $kategori_nama = $request->kategori_nama;
            @endphp
            {{ $datas->onEachSide(1)
    ->appends(['cari' => $cari])
    ->appends(['kategori_nama' => $kategori_nama])
    ->links() }}
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection