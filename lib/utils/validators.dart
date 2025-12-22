class Validators {
  // Name validator
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome';
    }

    if (value.trim().length < 3) {
      return 'O nome deve ter pelo menos 3 caracteres';
    }

    return null;
  }

  // Email validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail';
    }

    final trimmedValue = value.trim();

    if (!trimmedValue.contains('@')) {
      return 'E-mail deve conter @';
    }

    // Check for domain with .com, .br, etc
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(trimmedValue)) {
      return 'E-mail inválido (ex: usuario@dominio.com)';
    }

    return null;
  }

  // Password validator with security requirements
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }

    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }

    // Check for uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'A senha deve conter pelo menos uma letra maiúscula';
    }

    // Check for digit
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um número';
    }

    // Check for special character (database-safe symbols)
    if (!RegExp(r'[!@#$%^&*()_+\-=\[\]{};:,.<>?]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um símbolo (!@#\$^&*()_+-=[]{};:,.<>?)';
    }

    // Only allow alphanumeric and safe special characters (prevent SQL injection)
    if (!RegExp(
      r'^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:,.<>?]+$',
    ).hasMatch(value)) {
      return 'A senha contém caracteres não permitidos';
    }

    return null;
  }

  // Confirm password validator
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha';
    }

    if (value != password) {
      return 'As senhas não coincidem';
    }

    return null;
  }
}
