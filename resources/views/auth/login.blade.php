<x-guest-layout>
    <div class="login-container">
        <div class="login-card">
            <div class="brand-logo">
                <i class="fas fa-wallet"></i> N
            </div>
            <h1 class="login-title">Welcome Back</h1>
            <p class="login-subtitle">Masuk untuk mengelola keuangan sekolah</p>

            <x-jet-validation-errors class="mb-4" />

            @if (session('status'))
                <div class="mb-4 font-medium text-sm text-green-600">
                    {{ session('status') }}
                </div>
            @endif

            <form method="POST" action="{{ route('login') }}">
                @csrf

                <div class="mb-4">
                    <label class="form-label" for="email">{{ __('Email') }}</label>
                    <input id="email" class="custom-input" type="email" name="email" :value="old('email')" required
                        autofocus />
                </div>

                <div class="mb-4">
                    <label class="form-label" for="password">{{ __('Password') }}</label>
                    <input id="password" class="custom-input" type="password" name="password" required
                        autocomplete="current-password" />
                </div>

                <div class="flex items-center justify-between mt-4 mb-6">
                    <label for="remember_me" class="flex items-center">
                        <x-jet-checkbox id="remember_me" name="remember" />
                        <span class="ml-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
                    </label>

                    @if (Route::has('password.request'))
                        <a class="underline text-sm text-gray-600 hover:text-gray-900"
                            href="{{ route('password.request') }}">
                            {{ __('Forgot Password?') }}
                        </a>
                    @endif
                </div>

                <button class="custom-btn">
                    {{ __('Log in') }}
                </button>
            </form>
        </div>
    </div>
</x-guest-layout>