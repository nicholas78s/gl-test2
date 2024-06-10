/*
	� �� ���� ��� �������: 
	collaborators - ������� �����������. ����: id, name (��� ����������), subdivision_id (id ������������� ����������), age (�������).
	subdivisions - ������� �������������. ����: id, name, parent_id (id ������������� �������������)
*/

USE [test1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subdivisions](
	[id] [bigint] NULL,
	[name] [varchar](250) NULL,
	[parent_id] [bigint] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[collaborators](
	[id] [bigint] NULL,
	[name] [varchar](250) NULL,
	[subdivision_id] [bigint] NULL,
	[age] [int] NULL
) ON [PRIMARY]
GO

---

delete from collaborators

insert into collaborators(id, name, subdivision_id, age)
values 
	(710253, '��������� 1', 100003, 35),
	(710254, '��������� 2', 100002, 32),
	(710255, '��������� 3', 100001, 19),
	(710255, '��������� 4', 100001, 19),
	(710256, '��������� 5', 100001, 59),
	(710257, '��������� 6', 100001, 49),
	(710258, '��������� 7', 100055, 39),
	(710259, '��������� 8', 100059, 29),
	(710260, '��������� 9', 100004, 41),
	(710261, '��������� 10', 100005, 40),
	(710262, '��������� 11', 100006, 29),
	(710263, '��������� 12', 100055, 27),
	(710264, '��������� 13', 100059, 55),
	(710265, '��������� 14', 100007, 38),
	(710266, '��������� 15', 100008, 41),
	(710267, '��������� 16', 100009, 22)
	

delete from subdivisions

insert into subdivisions(id, name, parent_id)
values 
	(100001, 'Department 100001', null),
	(100002, 'Department 100002', 100001),
	(100003, 'Department 100003 - 710253 ��������� 1', 100002),
	(100004, 'Department 100004', 100003),
	(100005, 'Department 100005', 100004),
	(100006, 'Department 100006', 100005),
	(100055, 'Department 100055*', 100006),
	(100059, 'Department 100059*', 100055),
	(100007, 'Department 100007', 100059),
	(100008, 'Department 100004a', 100003),
	(100009, 'Department 100009', 100008)