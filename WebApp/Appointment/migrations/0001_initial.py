# Generated by Django 3.0.4 on 2020-05-04 15:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Appointment',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('reason', models.CharField(db_column='Reason', max_length=255)),
                ('date', models.DateField(db_column='Date')),
                ('patient', models.CharField(db_column='Patient', max_length=9)),
                ('doctor', models.CharField(db_column='Doctor', max_length=9)),
                ('room', models.CharField(db_column='Room', max_length=4)),
            ],
            options={
                'db_table': 'Appointment',
                'managed': False,
            },
        ),
    ]
