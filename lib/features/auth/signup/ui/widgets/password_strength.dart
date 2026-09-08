import 'package:flutter/material.dart';
import 'package:mini_shop/core/theme/app_colors.dart';

class PasswordStrengthWidget extends StatelessWidget {
  const PasswordStrengthWidget({
    super.key,
    required this.password,
    required this.confirmPassword,
  });

  final String password;
  final String confirmPassword;

  int get strength {
    if (password.isEmpty) return 0;

    int score = 0;

    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]+]').hasMatch(password)) {
      score++;
    }

    return score;
  }

  String get strengthText {
    switch (strength) {
      case 1:
      case 2:
        return 'Weak';
      case 3:
        return 'Medium';
      case 4:
        return 'Strong';
      case 5:
        return 'Very strong';
      default:
        return '';
    }
  }

  bool get hasMinLength => password.length >= 8;
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(password);
  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(password);
  bool get hasNumber => RegExp(r'[0-9]').hasMatch(password);
  bool get hasSpecialChar =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]+]').hasMatch(password);

  bool get passwordsMatch =>
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty && confirmPassword.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (password.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Password strength',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    strengthText,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: List.generate(5, (index) {
                final isActive = index < strength;

                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    height: 6,
                    margin: EdgeInsets.only(right: index == 4 ? 0 : 5),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primaryBlue
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _Requirement(text: '8+ characters', isValid: hasMinLength),
                _Requirement(text: 'Uppercase', isValid: hasUppercase),
                _Requirement(text: 'Lowercase', isValid: hasLowercase),
                _Requirement(text: 'Number', isValid: hasNumber),
                _Requirement(
                  text: 'Special character',
                  isValid: hasSpecialChar,
                ),
              ],
            ),
          ],

          if (password.isNotEmpty && confirmPassword.isNotEmpty)
            const SizedBox(height: 12),

          if (confirmPassword.isNotEmpty)
            _PasswordMatch(isMatch: passwordsMatch),
        ],
      ),
    );
  }
}

class _Requirement extends StatelessWidget {
  const _Requirement({required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isValid ? AppColors.primaryBlue : Colors.transparent,
            border: Border.all(
              color: isValid ? AppColors.primaryBlue : Colors.grey.shade300,
            ),
          ),
          child: isValid
              ? const Icon(Icons.check, size: 12, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: isValid ? AppColors.primaryBlue : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _PasswordMatch extends StatelessWidget {
  const _PasswordMatch({required this.isMatch});

  final bool isMatch;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isMatch
            ? AppColors.primaryBlue.withValues(alpha: 0.08)
            : Colors.red.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            isMatch ? Icons.check_circle_rounded : Icons.info_outline_rounded,
            size: 16,
            color: isMatch ? AppColors.primaryBlue : Colors.red,
          ),
          const SizedBox(width: 7),
          Text(
            isMatch ? 'Passwords match' : 'Passwords do not match',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isMatch ? AppColors.primaryBlue : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
