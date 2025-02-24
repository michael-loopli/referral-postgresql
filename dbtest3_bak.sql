PGDMP         
    
            |           dbtest3    15.7 (Debian 15.7-0+deb12u1)    15.7 (Debian 15.7-0+deb12u1) '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24981    dbtest3    DATABASE     s   CREATE DATABASE dbtest3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE dbtest3;
                testusr    false            �            1259    24983 	   companies    TABLE     S   CREATE TABLE public.companies (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.companies;
       public         heap    testusr    false            �            1259    24982    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          testusr    false    215            �           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          testusr    false    214            �            1259    25027    referral_requests    TABLE     �  CREATE TABLE public.referral_requests (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    referrer_user_id integer NOT NULL,
    company_id integer,
    referee_client text NOT NULL,
    referee_client_email text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status text DEFAULT 'pending'::text NOT NULL
);
 %   DROP TABLE public.referral_requests;
       public         heap    testusr    false            �            1259    25026    referral_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.referral_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.referral_requests_id_seq;
       public          testusr    false    221            �           0    0    referral_requests_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.referral_requests_id_seq OWNED BY public.referral_requests.id;
          public          testusr    false    220            �            1259    25010    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id text NOT NULL,
    user_id integer NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sessions;
       public         heap    testusr    false            �            1259    25009    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          testusr    false    219            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          testusr    false    218            �            1259    24994    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    company_id integer
);
    DROP TABLE public.users;
       public         heap    testusr    false            �            1259    24993    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          testusr    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          testusr    false    216                       2604    24986    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    214    215    215                       2604    25030    referral_requests id    DEFAULT     |   ALTER TABLE ONLY public.referral_requests ALTER COLUMN id SET DEFAULT nextval('public.referral_requests_id_seq'::regclass);
 C   ALTER TABLE public.referral_requests ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    221    220    221                       2604    25013    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    218    219    219                       2604    24997    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    216    217    217            �          0    24983 	   companies 
   TABLE DATA           -   COPY public.companies (id, name) FROM stdin;
    public          testusr    false    215   `-       �          0    25027    referral_requests 
   TABLE DATA           �   COPY public.referral_requests (id, username, title, content, referrer_user_id, company_id, referee_client, referee_client_email, created_at, status) FROM stdin;
    public          testusr    false    221   �-       �          0    25010    sessions 
   TABLE DATA           S   COPY public.sessions (id, session_id, user_id, expires_at, created_at) FROM stdin;
    public          testusr    false    219   r.       �          0    24994    users 
   TABLE DATA           P   COPY public.users (id, email, username, password, role, company_id) FROM stdin;
    public          testusr    false    217   $/       �           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 2, true);
          public          testusr    false    214            �           0    0    referral_requests_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.referral_requests_id_seq', 1, true);
          public          testusr    false    220            �           0    0    sessions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);
          public          testusr    false    218            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 20, true);
          public          testusr    false    216                       2606    24992    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            testusr    false    215                       2606    24990    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            testusr    false    215            &           2606    25036 (   referral_requests referral_requests_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_pkey;
       public            testusr    false    221            "           2606    25018    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            testusr    false    219            $           2606    25020     sessions sessions_session_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);
 J   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_session_id_key;
       public            testusr    false    219                       2606    25003    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            testusr    false    217                        2606    25001    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            testusr    false    217            )           2606    25042 3   referral_requests referral_requests_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 ]   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_company_id_fkey;
       public          testusr    false    221    3356    215            *           2606    25037 9   referral_requests referral_requests_referrer_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_referrer_user_id_fkey FOREIGN KEY (referrer_user_id) REFERENCES public.users(id);
 c   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_referrer_user_id_fkey;
       public          testusr    false    3360    221    217            (           2606    25021    sessions sessions_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id_fkey;
       public          testusr    false    217    3360    219            '           2606    25004    users users_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_company_id_fkey;
       public          testusr    false    3356    217    215            �   t   x��=�0���)|$��-C�F��֒�$T���淦��m��0`KwI3�|���U����X��ۧ��=��ۿ�@������/�4�?���֦��D]��t>K�)��Y$^      �   ~   x�-��
�0Eg�+��+qi�ԡS��@�P�>���mJ�>I)�r�`����n��Y���T�Q�2�j�K�Ey����hۯ�(�+)�wx�mhcNu�!�@��{���X����9�IX)�      �   �   x�U��
�@ ���W�ʝW��	�$4ӄ@#��_�2]��!��~S�ܕޒ�Nm ua�I<B�]_�߫=G|��`��@��M�R3��:J��))1E�%�q2ջ����f���x�&9?Na>�øiv(͹f�	R�?�5&8�;�W�4�      �   w  x�m�ɖ�J�5>��^���+Aep��M&$��2>�-����6�<|'2�`�~�iLiN��4�������[M�yY���H�|OdJeq�P�V��رm�v=�\^d�
��.TQe8_81I(f�R��^��co��I�4w������%��j��1���m�* (�^�ɋ�Ӗ��,��H �E���v0�`Dl��O�4�(��'i��}Ե��ޮr�������º��F���ք?.i�lV|(���ϢO�H�qEu��`Ҿ��`B��"&���R4<��7w�1��C��c�턳�h��]|C�:��t�l2�*����TU�c���4�"�⧵���+{��m�p��i��T�;�Z�����s�Ŏ`�Xrw�]��K�8WW����(��(O��.S샡�oJ���5;�[�����1qwe|��6�����NA���ݣ�8��G������U��=�gy����|M,7�%�r'I�b�EU?��J�6�������̸�y���)7�I��p�������p�,��|����M�`�l�j�ePq�����n�P� ��s�Gi�(�;�9����r�d�d�<�=�/�o�m�]�[ڹ�Vp��|�ϻ?���������j�&�[
;"/s�����q����m��il���g�I��Ρ�?V�%v+}��[�zl��<όh��u	Ǘ�P�	l�9�1�[ ��;���p�U|C��_��C�ũ�M���6s���Zi�=?�Z���欝f����#�
���OcX�v�]mx|����T�y�q�4���
��CmT߭��02c�*�߳[���l��Ҿ�a�TK�0/I�.I��{bJ����W��>�'%M��7�&�ą-i��|6�����a#[��e�C0<R������	��{�<E乫��jͯ�NS�1������t�?�4�۱��J�,KK�h ����&Ӫ��GN�{E�40
���v��'N�>I���g�o3ds'�`��}��=��W�*�]�>�z���"N���&�p��/p6`f�ү"������.�}�ƒ���N ��U��&3/f�>=��yXJ<C�[Y��΂1c�������*� $���E)�Q�z�(����b8T���2bq@�Z�K�y�ݗ�Y"�27�EFl�s�+��:��D�Az��r��jb�i�ӯ����������H�.'���cd�h� 8W�z,�g#��u���_��EW�����v�z@ۇ�y9�ɇ�cX�;� ^�D�ׁ��x�2.�J�Se.�?=%���
k2��;N�#ˉ��!������4G4��2?`i
"�A�q���x
��HUG�^�|����P9$�T��&�|��jBĄ��ʂ�[N^��spR^=���`0�"���     