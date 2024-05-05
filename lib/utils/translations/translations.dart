import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "on_boarding_first_title": "Start Managing Your Tasks",
          "on_boarding_second_title": "Create Daily Schedule",
          "on_boarding_third_title": "Organize Your Tasks",
          "on_boarding_first_description":
              "Easily manage all your daily tasks in DoMe",
          "on_boarding_second_description":
              "Create your personal schedule for effective work in Uptodo",
          "on_boarding_third_description":
              "Organize your daily tasks by adding them to separate categories",
          "skip": 'Skip',
          "back": 'Back',
          'next': 'Next',
          'get_started': 'Get Started',
          'reminders': 'Reminders',
          'tasks': 'Tasks',
          'reminder_screen': 'Reminder Screen',
          'task_screen': 'Task Screen',
          'create_a_note': 'Create a Note',
          'title': 'Title',
          'list_of_notes': 'List of Notes',
          'create': "Create",
          'please_enter_task': 'Please Enter Task',
          'rename': 'Rename',
          'select_a_date':'Select a Date',
          'choose': 'Choose',
          'cancel':'Cancel',
          'select_a_time':'Select a Time',
          'cancel_time':'Cancel',
          'deleting':'Deleting',
          'yes': "Yes",
          'no': "No",
          'please_enter_a_list_of_tasks':'Please enter a list of tasks',
          "enter_your_daily_task":"Enter your daily task",
          'add_a_task':'Add Task',
          "description":"description",
          "start_time":"Start Time",
          "end_time":"End Time",
          "ok":"Ok",
          "message":"Message",
          "error_one_time":"You have selected the wrong time from the start time to the end of the task! ('End time is less than start time')",
          "error_two_time":"You have selected the same start and end times for the task",
          "error_three_time":"You chose the wrong end time for the task! ('The start time is greater than the end time')",
          "error":"Error",
        },
        'ru_RU': {
          "on_boarding_first_title": "Начните управлять своими задачами",
          "on_boarding_second_title": "Создайте ежедневное расписание",
          "on_boarding_third_title": "Организуйте свои задачи",
          "on_boarding_first_description":
              "Легко управляйте всеми своими повседневными задачами в DoMe",
          "on_boarding_second_description":
              "Создайте ваш персональный график для эффективной работы в Uptodo",
          "on_boarding_third_description":
              "Организуйте свои ежедневные задачи, добавляя их в отдельные категории",
          "skip": 'Пропускать',
          'back': 'Назад',
          "next": 'Следующий',
          'get_started': 'Начать',
          'reminders': 'Примечания',
          'tasks': 'Задания',
          'reminder_screen': 'Экран напоминания',
          'task_screen':'Экран задач',
          'create_a_note': 'Создать заметку',
          'title': 'Заголовок',
          'list_of_notes': 'Список заметок',
          'create': 'Создавать',
          'please_enter_task': 'Пожалуйста, введите задачу',
          'rename': 'Переименовать',
          'select_a_date': 'Выберите дату',
          'select_a_time': 'Выберите время',
          'choose': 'Выбирать',
          'cancel': 'Отмена',
          'cancel_time':'Отмена',
          'deleting':'Удаление',
          'yes': 'Да',
          'no': 'Нет',
          "please_enter_a_list_of_tasks":"Введите список задач",
          "enter_your_daily_task":"Введите свою ежедневную задачу",
          "add_a_task":"Добавить задачу",
          "description":"Описание",
          "start_time":"Время начала",
          "end_time":"Время окончания",
          "ok":"Хорошо",
          "message":"Сообщение",
          "error_one_time":"Вы выбрали неправильное время от времени начала до времени окончания задания! («Время окончания меньше времени начала»)",
          "error_two_time":"Вы выбрали одинаковое время начала и окончания задачи.",
          "error_three_time":"Вы выбрали неправильное время от времени начала до времени окончания задания! («Время начала больше времени завершения»)",
          "error":"Ошибка",
        },
        'uz_Uz': {
          "on_boarding_first_title": "Vazifalaringizni boshqaring",
          "on_boarding_second_title": "Kundalik tartibni yarating",
          "on_boarding_third_title": "Vazifalaringizni tartibga soling",
          "on_boarding_first_description":
              "DoMe-da barcha kundalik vazifalaringizni osongina boshqarishingiz mumkin",
          "on_boarding_second_description":
              "Uptodo-da samarali ishlash uchun o'zingizning shaxsiy tartibingizni yaratishingiz mumkin",
          "on_boarding_third_description":
              "Vazifalaringizni alohida toifalarga qo'shish orqali kundalik vazifalaringizni tartibga solishingiz mumkin",
          "skip": "O'tkazib yuborish",
          "back": 'Orqaga',
          'next': 'Keyingisi',
          'get_started': 'Boshlash',
          'reminders': 'Eslatmalar',
          'tasks': 'Vazifalar',
          'reminder_screen': 'Eslatma ekrani',
          'task_screen': 'Vazifalar ekrani',
          'create_a_note':'Eslatma Yarating',
          'title': 'Sarlavha',
          'list_of_notes': "Eslatmalar Ro'yxati",
          'create': 'Yaratmoq',
          'please_enter_task': 'Iltimos, vazifani kiriting',
          'rename': "Nomini o'zgartirish",
          'select_a_date': 'Sana tanlang',
          'choose':'Tanlang',
          'cancel': 'Bekor qilish',
          'cancel_time': 'Bekor',
          'select_a_time': 'Vaqtni Tanlang',
          'deleting':'Oʻchirilmoqda',
          'yes': 'Ha',
          'no': "Yo'q",
          "please_enter_a_list_of_tasks":"Iltimos, vazifalar ro'yxatini kiriting",
          "enter_your_daily_task":"Kundalik vazifangizni kiriting",
          "add_a_task":"Vazifa Qo'shing",
          'description':'Tavsif',
          "start_time":"Boshlash vaqti",
          "end_time":"Tugash vaqti",
          "message":'Xabar',
          "ok":"Yaxshi",
          "error_one_time":"Siz topshiriqning boshlanish vaqtidan yakunlanish vaqtini noto'g'ri  tanladingiz! ('Yakunlash vaqti boshlanish vaqtidan kamroq')",
          "error_two_time":"Siz vazifa uchun bir xil boshlanish va tugash vaqtlarini tanladingiz",
          "error_three_time":"Siz topshiriqning boshlanish vaqtidan yakunlanish vaqtini noto'g'ri  tanladingiz! ('Boshlash vaqti yankunlanish vaqtidan ko'proq')",
          "error":"Xato",
        }
      };
}
