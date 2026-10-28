import 'package:flutter/material.dart';

const Color kOrange = Color(0xFFE8590C);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildProfileInfo(),
              _buildPhoto(),
              const SizedBox(height: 16),
              Container(height: 6, color: const Color(0xFFF2F2F2)),
              _buildStats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.ios_share, size: 28),
          SizedBox(width: 20),
          Icon(Icons.search, size: 28),
          SizedBox(width: 20),
          Icon(Icons.settings_outlined, size: 28),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundColor: Color(0xFFE0E0E0),
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('jo jo',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('Central Java, Indonesia',
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              _FollowStat(label: 'Mengikuti', value: '0'),
              SizedBox(width: 32),
              _FollowStat(label: 'Para Pengikut', value: '1'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _OutlineButton(
                  icon: Icons.qr_code_2, label: 'Bagikan Kode QR saya'),
              const SizedBox(width: 12),
              _OutlineButton(icon: Icons.edit_outlined, label: 'Edit'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 90,
          height: 90,
          color: Colors.grey.shade400,
          child: const Icon(Icons.pedal_bike, size: 40, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _ChipButton(
                  icon: Icons.directions_walk,
                  label: 'Berjalan',
                  selected: false),
              const SizedBox(width: 12),
              _ChipButton(
                  icon: Icons.hiking, label: 'Mendaki', selected: true),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Minggu ini',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: const [
              _Metric(label: 'Jarak', value: '0,00 km'),
              SizedBox(width: 32),
              _Metric(label: 'Waktu', value: '0j'),
              SizedBox(width: 32),
              _Metric(label: 'Elevasi', value: '0 m'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            width: double.infinity,
            child: CustomPaint(painter: _ChartPainter()),
          ),
        ],
      ),
    );
  }
}

class _FollowStat extends StatelessWidget {
  final String label, value;
  const _FollowStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _OutlineButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: kOrange, size: 20),
      label: Text(label,
          style: const TextStyle(color: kOrange, fontWeight: FontWeight.bold)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kOrange),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _ChipButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _ChipButton(
      {required this.icon, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    final color = selected ? kOrange : Colors.black87;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: selected ? kOrange : Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: color, fontSize: 16)),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label, value;
  const _Metric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<double> data = [0, 0, 0, 14, 0, 0, 0, 7, 0, 0, 0, 0];

  @override
  void paint(Canvas canvas, Size size) {
    const left = 48.0, top = 24.0, bottom = 36.0, maxY = 14.0;
    final w = size.width - left;
    final h = size.height - top - bottom;
    final step = w / (data.length - 1);

    final gridPaint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 1;
    final linePaint = Paint()
      ..color = kOrange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()..color = kOrange.withOpacity(0.15);

    // Grid vertikal
    for (int i = 0; i < data.length; i++) {
      final x = left + step * i;
      canvas.drawLine(Offset(x, top), Offset(x, top + h), gridPaint);
    }
    // Grid horizontal + label sumbu Y
    for (final v in [0.0, 7.0, 14.0]) {
      final y = top + h - (v / maxY) * h;
      canvas.drawLine(Offset(left, y), Offset(size.width, y), gridPaint);
      _text(canvas, '${v.toInt()} km', Offset(0, y - 8), 12, Colors.black54);
    }

    final points = [
      for (int i = 0; i < data.length; i++)
        Offset(left + step * i, top + h - (data[i] / maxY) * h)
    ];

    // Area + garis
    final line = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      line.lineTo(p.dx, p.dy);
    }
    final area = Path.from(line)
      ..lineTo(points.last.dx, top + h)
      ..lineTo(points.first.dx, top + h)
      ..close();
    canvas.drawPath(area, fillPaint);
    canvas.drawPath(line, linePaint);

    // Titik
    for (int i = 0; i < points.length; i++) {
      final last = i == points.length - 1;
      canvas.drawCircle(points[i], 6, Paint()..color = last ? kOrange : Colors.white);
      canvas.drawCircle(
          points[i],
          6,
          Paint()
            ..color = kOrange
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.5);
    }

    // Label bulan + nilai terakhir
    _text(canvas, 'SEP', Offset(points[3].dx - 12, top + h + 10), 12, Colors.black54);
    _text(canvas, 'OKT', Offset(points[8].dx - 12, top + h + 10), 12, Colors.black54);
    _text(canvas, '0 km', Offset(size.width - 40, 0), 14, Colors.black,
        bold: true);
  }

  void _text(Canvas c, String t, Offset o, double size, Color color,
      {bool bold = false}) {
    final tp = TextPainter(
      text: TextSpan(
        text: t,
        style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, o);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}