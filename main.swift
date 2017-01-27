//
//  main.swift
//  CCTV calculator
//
//  Created by Said Qafarov on 19.01.17.
//  Copyright © 2017 Said Qafarov. All rights reserved.
//

import Foundation // comment

var cameraResolution: String? = nil
var cameraVideoFormat: String? = nil
var cameraFrameRate: String? = nil
var cameraAmmount: String? = nil
var cameraArchiveDays: String? = nil
var result: Int? = nil
let vga: String = String(900) // Расчет размера несжатого кадра Кб/с
let cif: String = String(1088) // Расчет размера несжатого кадра Кб/с
let hd: String = String(2700) // Расчет размера несжатого кадра Кб/с
let mpx122: String = String(3600) // Расчет размера несжатого кадра Кб/с
let mpx13: String = String(3840) // Расчет размера несжатого кадра Кб/с
let mpx2: String = String(5625) // Расчет размера несжатого кадра Кб/с
let fullHd: String = String(6075) // Расчет размера несжатого кадра Кб/с
let mpx3: String = String(9216) // Расчет размера несжатого кадра Кб/с
let mpx5: String = String(14762) // Расчет размера несжатого кадра Кб/с
let mpx8: String = String(23870) // Расчет размера несжатого кадра Кб/с
let h264: Int = 74 // Степень сжатия кодека
let mjpeg: Int = 15 // Степень сжатия кодека
var frameVolume: Int = Int() //Объем одного кадра
var oneHourRecordPerCamera: Int = Int()
var oneHourRecordPerCameras: Int = Int()
var h24: Int = Int()


print("Консольный CCTV калькулятор v0.1 (alpha)")
print("Бригада Василия Усова, www.swiftme.ru")
print()
print("Выберите разрешение камеры")
print("1 - 640 x 480 VGA")
print("2 - 704 x 576 4CIF")
print("3 - 1280 х 720 HD")
print("4 - 1280 х 960 1.22Mpx")
print("5 - 1280 х 1024 1.3Mpx")
print("6 - 1600 х 1200 2Mpx")
print("7 - 1920 х 1080 Full HD")
print("8 - 2048 х 1536 3Mpx")
print("9 - 2592 х 1944 5Mpx")
print("10 - 3296 х 2472 8Mpx")
print()
if var cameraResolutionSelect = readLine() {
    cameraResolution = cameraResolutionSelect
}
switch cameraResolution! {
case "1":
    cameraResolution = vga
    print("Выбранный тип : VGA")
case "2":
    cameraResolution = cif
    print("Выбранный тип : 4CIF")
case "3":
    cameraResolution = hd
    print("Выбранный тип : HD")
case "4":
    cameraResolution = mpx122
    print("Выбранный тип : 1.22Mpx")
case "5":
    cameraResolution = mpx13
    print("Выбранный тип : 1.3Mpx")
case "6":
    cameraResolution = mpx2
    print("Выбранный тип : 2Mpx")
case "7":
    cameraResolution = fullHd
    print("Выбранный тип : Full HD")
case "8":
    cameraResolution = mpx3
    print("Выбранный тип : 3Mpx")
case "9":
    cameraResolution = mpx5
    print("Выбранный тип : 5Mpx")
case "10":
    cameraResolution = mpx8
    print("Выбранный тип : 8Mpx")
default:
    print("Error!")
}
print()
print("Выберите тип кодека")
print("1 - H.264")
print("2 - MJPEG")
if var cameraVideoFormatSelect = readLine() {
    cameraVideoFormat = cameraVideoFormatSelect
}
switch cameraVideoFormat! {
case "1":
    
    cameraVideoFormat = String(h264)
    frameVolume = Int(cameraResolution!)! / Int(cameraVideoFormat!)! // Получаем размер сжатого кадра при H.264
    print("Выбранный тип : H.264")
case "2":
    cameraVideoFormat = String(mjpeg)
    frameVolume = Int(cameraResolution!)! / Int(cameraVideoFormat!)! // Получаем размер сжатого кадра при MJPEG
    print("Выбранный тип : MJPEG")
default:
    print("Error!")
}
print()
print("Введите количество кадров в секунду, от 1 до 25 к/с")
print()
if var cameraFrameRateSelect = readLine() {
    cameraFrameRate = cameraFrameRateSelect
}
print("Количество кадров в секунду : \(cameraFrameRate!)")
print()
print("Введите количество камер, от 1 до 32 камер")
print()
if var cameraAmmountSelect = readLine() {
    cameraAmmount = cameraAmmountSelect
}
print("Количество камер : \(cameraAmmount!)")
print()
print("Введите количество дней архива, от 1 до 90 дней")
if var cameraArchiveDaysSelect = readLine() {
    cameraArchiveDays = cameraArchiveDaysSelect
}
print("Количество дней записи в архив : \(cameraArchiveDays!) дней")
oneHourRecordPerCamera = (((Int(cameraFrameRate!)! * 60) * 60) * frameVolume / 1024) // Один час записи с камеры (Mbps)
oneHourRecordPerCameras = oneHourRecordPerCamera * Int(cameraAmmount!)! // Один час записи с камер (Mbps)
h24 = oneHourRecordPerCameras * 24 // Умножаем час работы всех камер на 24 часа (сутки)
result = (Int(cameraArchiveDays!)! * h24) // Умножаем количество дней на 24 часа работы камер и получаем объем диска
print("Необходимый объем HDD: \(result! / 1000) Gb")
print()


