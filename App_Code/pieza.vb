﻿Public Class Pieza
    Inherits elementoBase

    Private _nombre As String
    Private _stockReservado As Decimal
    Private _stock As Decimal
    Private _unidad As String
    Public _modificado As Boolean
    Private _stockMin As Decimal
    Shadows db As DbHelper = New DbHelper("materiales")

    Public Sub New()

    End Sub

    Public Sub New(_nombre As String, _unidad As String, _stockMin As Decimal)
        MyBase.New()
        Me._nombre = _nombre
        Me._unidad = _unidad
        _modificado = False
        Me._stockMin = _stockMin
    End Sub

    Public Sub New(_id As Integer)
        id = _id
        Dim t = db.getRow(_id)
        _nombre = t.Rows(0)("NOMBRE")
        _unidad = t.Rows(0)("UNIDAD")
        _stock = t.Rows(0)("STOCK_DISPONIBLE")
        _stockReservado = t.Rows(0)("STOCK_RESERVADO")
        _stockMin = t.Rows(0)("STOCK_MINIMO")
    End Sub

    Public Property nombre As String
        Set(value As String)
            registro.Add(String.Format("NOMBRE ANTERIOR: {0}, NUEVO: {1}", _nombre, value))
            _nombre = value
            _modificado = True
        End Set
        Get
            Return _nombre.Trim()
        End Get
    End Property

    Property unidad As String
        Set(value As String)
            _modificado = True
            registro.Add(String.Format("UNIDAD ANTERIOR: {0}, NUEVA: {1}", _unidad, value))
            _unidad = value
        End Set
        Get
            Return _unidad.Trim()
        End Get
    End Property

    Public Property stock As Decimal
        Set(value As Decimal)
            _modificado = True
            registro.Add(String.Format("STOCK ANTERIOR: {0}, NUEVO: {1}", _stock, value))
            _stock = value
        End Set
        Get
            Return _stock
        End Get
    End Property

    Public Property stockMinimo As Decimal
        Set(value As Decimal)
            _modificado = True
            registro.Add(String.Format("STOCK MINIMO ANTERIOR: {0}, NUEVO: {1}", _stockMin, value))
            _stockMin = value
        End Set
        Get
            Return _stockMin
        End Get
    End Property

    Public Overloads Sub insertar()
        Try
            registro.Clear()
            registro.Add("NUEVA PIEZA")
            DB.insertar(Me)
            DB.registrar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Overloads Sub actualizar()
        Try
            If _modificado Then
                db.actualizar(Me)
                db.registrar(Me)
            Else
                Throw New Exception("No se realizaron cambios")
            End If

        Catch ex As Exception
            Throw
        End Try
    End Sub

    Friend Sub eliminar()
        Try

            db.eliminar(Me)
            registro.Clear()
            registro.Add("pieza eliminada")
            db.registrar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub actualizarStock(_s As Decimal, _m As String)
        stock = _s
        registro.Add(String.Format("STOCK ANTERIOR: {0}, NUEVO: {1} - ORDEN DE COMPRA/MOTIVO: {2}", _stock, _s, _m))

    End Sub
End Class
