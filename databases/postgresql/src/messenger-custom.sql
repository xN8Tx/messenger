PGDMP     #                    {            dbname_zkkc    15.2    15.2     Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    16389    dbname_zkkc    DATABASE     v   CREATE DATABASE dbname_zkkc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE dbname_zkkc;
                n8t    false            ]           0    0    dbname_zkkc    DATABASE PROPERTIES     4   ALTER DATABASE dbname_zkkc SET "TimeZone" TO 'utc';
                     n8t    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                n8t    false            �            1259    16419    content    TABLE     X   CREATE TABLE public.content (
    id bigint NOT NULL,
    messages character varying
);
    DROP TABLE public.content;
       public         heap    n8t    false    5            �            1259    16418    content_id_seq    SEQUENCE     �   ALTER TABLE public.content ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          n8t    false    219    5            �            1259    16403    messages    TABLE     �   CREATE TABLE public.messages (
    id bigint NOT NULL,
    "fromID" bigint,
    "toID" bigint,
    "contentID" bigint,
    date date,
    upgradedate date,
    readed boolean
);
    DROP TABLE public.messages;
       public         heap    n8t    false    5            �            1259    16402    messages_id_seq    SEQUENCE     �   ALTER TABLE public.messages ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          n8t    false    217    5            �            1259    16397    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(50),
    username character varying(25),
    name character varying(50)
);
    DROP TABLE public.users;
       public         heap    n8t    false    5            �            1259    16396    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          n8t    false    215    5            V          0    16419    content 
   TABLE DATA           /   COPY public.content (id, messages) FROM stdin;
    public          n8t    false    219          T          0    16403    messages 
   TABLE DATA           `   COPY public.messages (id, "fromID", "toID", "contentID", date, upgradedate, readed) FROM stdin;
    public          n8t    false    217   $       R          0    16397    users 
   TABLE DATA           :   COPY public.users (id, email, username, name) FROM stdin;
    public          n8t    false    215   A       ^           0    0    content_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.content_id_seq', 1, false);
          public          n8t    false    218            _           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 1, false);
          public          n8t    false    216            `           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          n8t    false    214            �           2606    16425    content content_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.content DROP CONSTRAINT content_pkey;
       public            n8t    false    219            �           2606    16407    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            n8t    false    217            �           2606    16401    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            n8t    false    215            �           2606    16426    messages contentID    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "contentID" FOREIGN KEY ("contentID") REFERENCES public.content(id) NOT VALID;
 >   ALTER TABLE ONLY public.messages DROP CONSTRAINT "contentID";
       public          n8t    false    217    3007    219            �           2606    16408    messages fromID    FK CONSTRAINT     q   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "fromID" FOREIGN KEY ("fromID") REFERENCES public.users(id);
 ;   ALTER TABLE ONLY public.messages DROP CONSTRAINT "fromID";
       public          n8t    false    3003    215    217            �           2606    16413    messages toID    FK CONSTRAINT     m   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "toID" FOREIGN KEY ("toID") REFERENCES public.users(id);
 9   ALTER TABLE ONLY public.messages DROP CONSTRAINT "toID";
       public          n8t    false    217    3003    215            �           826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     K   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO n8t;
                   postgres    false                        826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     G   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO n8t;
                   postgres    false            �           826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     K   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO n8t;
                   postgres    false            �           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     H   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO n8t;
                   postgres    false            V      x������ � �      T      x������ � �      R      x������ � �     