<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>{{ config('app.name', 'Laravel') }}</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <!-- Modern Auth CSS -->
  <link rel="stylesheet" href="{{ asset('assets/css/modern-auth.css') }}">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

</head>

<body>
  <div class="login-container">
    <div class="login-card">
      <div class="brand-logo">
        <img src="{{asset('/assets/upload/logoyayasan.png')}}" alt="logo" width="30" class="rounded-circle mr-2">
        <!-- Or keep the 'N' if preferred, but user had a school logo -->
      </div>

      <h1 class="login-title">SISTEM ADMINISTRASI KEUANGAN SEKOLAH</h1>
      <p class="login-subtitle">Silahkan login untuk melanjutkan</p>

      <form action="{{ route('login') }}" method="POST">
        @csrf

        <div class="mb-4">
          <label class="form-label" for="email">Email</label>
          <input id="email" type="email" class="custom-input @error('email') is-invalid @enderror" name="email"
            tabindex="1" required autofocus>
          @error('email')
            <div style="color: red; font-size: 13px; margin-top: 5px;">
              {{ $message }}
            </div>
          @enderror
        </div>

        <div class="mb-4">
          <div style="display: flex; justify-content: space-between;">
            <label class="form-label" for="password">Password</label>
          </div>
          <input id="password" type="password" class="custom-input @error('password') is-invalid @enderror"
            name="password" tabindex="2" required>
          @error('password')
            <div style="color: red; font-size: 13px; margin-top: 5px;">
              {{ $message }}
            </div>
          @enderror
        </div>

        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px;">
          <label for="remember-me"
            style="display: flex; align-items: center; font-size: 14px; color: #718096; cursor: pointer;">
            <input type="checkbox" name="remember" id="remember-me" tabindex="3" style="margin-right: 8px;">
            Remember Me
          </label>
        </div>

        <button type="submit" class="custom-btn" tabindex="4">
          Login
        </button>
      </form>

      <div style="text-align: center; margin-top: 20px; color: #a0aec0; font-size: 12px;">
        Copyright &copy; 2022 v0.1
      </div>
    </div>
  </div>
</body>

</html>