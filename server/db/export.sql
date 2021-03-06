PGDMP         7        	         w         	   artograph    10.5    10.5 '    n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            q           1262    17472 	   artograph    DATABASE     {   CREATE DATABASE artograph WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE artograph;
             mckenzie    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             mckenzie    false            r           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  mckenzie    false    3                        3079    13267    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            s           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17473 
   ArtistTags    TABLE     �   CREATE TABLE public."ArtistTags" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "tagId" integer NOT NULL
);
     DROP TABLE public."ArtistTags";
       public         mckenzie    false    3            �            1259    17476    Artists    TABLE     q  CREATE TABLE public."Artists" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    lat numeric,
    lng numeric,
    insta character varying(255),
    region character varying(255),
    followers character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Artists";
       public         mckenzie    false    3            �            1259    17482    Artists_id_seq    SEQUENCE     y   CREATE SEQUENCE public."Artists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Artists_id_seq";
       public       mckenzie    false    197    3            t           0    0    Artists_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Artists_id_seq" OWNED BY public."Artists".id;
            public       mckenzie    false    198            �            1259    17484 	   Favorites    TABLE     �   CREATE TABLE public."Favorites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."Favorites";
       public         mckenzie    false    3            �            1259    17487    Tags    TABLE     �   CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Tags";
       public         mckenzie    false    3            �            1259    17490    Tags_id_seq    SEQUENCE     v   CREATE SEQUENCE public."Tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Tags_id_seq";
       public       mckenzie    false    200    3            u           0    0    Tags_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;
            public       mckenzie    false    201            �            1259    17492    Users    TABLE     -  CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255),
    username character varying(255),
    password character varying(255),
    lat numeric,
    lng numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Users";
       public         mckenzie    false    3            �            1259    17498    Users_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       mckenzie    false    202    3            v           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
            public       mckenzie    false    203            �           2604    17500 
   Artists id    DEFAULT     l   ALTER TABLE ONLY public."Artists" ALTER COLUMN id SET DEFAULT nextval('public."Artists_id_seq"'::regclass);
 ;   ALTER TABLE public."Artists" ALTER COLUMN id DROP DEFAULT;
       public       mckenzie    false    198    197            �           2604    17501    Tags id    DEFAULT     f   ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);
 8   ALTER TABLE public."Tags" ALTER COLUMN id DROP DEFAULT;
       public       mckenzie    false    201    200            �           2604    17502    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       mckenzie    false    203    202            d          0    17473 
   ArtistTags 
   TABLE DATA               U   COPY public."ArtistTags" ("createdAt", "updatedAt", "artistId", "tagId") FROM stdin;
    public       mckenzie    false    196   5+       e          0    17476    Artists 
   TABLE DATA               r   COPY public."Artists" (id, name, email, lat, lng, insta, region, followers, "createdAt", "updatedAt") FROM stdin;
    public       mckenzie    false    197   �3       g          0    17484 	   Favorites 
   TABLE DATA               U   COPY public."Favorites" ("createdAt", "updatedAt", "artistId", "userId") FROM stdin;
    public       mckenzie    false    199   �R       h          0    17487    Tags 
   TABLE DATA               D   COPY public."Tags" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       mckenzie    false    200   ET       j          0    17492    Users 
   TABLE DATA               d   COPY public."Users" (id, email, username, password, lat, lng, "createdAt", "updatedAt") FROM stdin;
    public       mckenzie    false    202   jX       w           0    0    Artists_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Artists_id_seq"', 169, true);
            public       mckenzie    false    198            x           0    0    Tags_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Tags_id_seq"', 66, true);
            public       mckenzie    false    201            y           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);
            public       mckenzie    false    203            �           2606    17504    ArtistTags ArtistTags_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_pkey" PRIMARY KEY ("artistId", "tagId");
 H   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_pkey";
       public         mckenzie    false    196    196            �           2606    17506    Artists Artists_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Artists"
    ADD CONSTRAINT "Artists_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Artists" DROP CONSTRAINT "Artists_pkey";
       public         mckenzie    false    197            �           2606    17508    Favorites Favorites_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY ("artistId", "userId");
 F   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_pkey";
       public         mckenzie    false    199    199            �           2606    17510    Tags Tags_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Tags" DROP CONSTRAINT "Tags_pkey";
       public         mckenzie    false    200            �           2606    17512    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         mckenzie    false    202            �           2606    17513 #   ArtistTags ArtistTags_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_artistId_fkey";
       public       mckenzie    false    3040    197    196            �           2606    17518     ArtistTags ArtistTags_tagId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public."Tags"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_tagId_fkey";
       public       mckenzie    false    196    3044    200            �           2606    17523 !   Favorites Favorites_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_artistId_fkey";
       public       mckenzie    false    199    197    3040            �           2606    17528    Favorites Favorites_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_userId_fkey";
       public       mckenzie    false    199    202    3046            d   B  x���[r%�E��GQ(	�G����i�A��H%��޹,$��#��Q�"�T/����/���J_���.��dyL��d{L��!��7����G*/��hݠ��Z*t���X-[��P�l�Y��.��>�ղ��Rڠ�R7.Q/�P���r{�Eۥ)��7�,����X�"�-�8��B�G�(!*�����I�ygs�Zzq~�B{�����Hv��P�vmr�R��m�[#Q��?�7����m�N��R<`O�"�5h�M�J�*-cY�;��d9sd,K�c�#�`��l�r�Vy�Β
�u��ֱY�# ��RYX�R�J]���y�&}�cQKIP�{_	��E�H/>`O�v�0>_��]e�E>���zܣ�~Bю�%��@�F;�$'����zg����H���D�.�‏.�W��� � k${m:�OX9����8��`l�Y�M��JR�t���z�9+�9�|��{0V2��_�],� i=�QJK ��K���Fiug'ʖԋchmG.ҒszQ���g�s�Y��_9h�t�j_B�9;/z7{��e�{�+<66�Ji����3=�F�"/��FDN&�D�⦵�����(�z+	
(uV`v����]$��� �G���c�TOj��l�Y�Mo�	&��2I�:)k��%n���79y�EZ�w~��>[a\�Dَ���(����-��5�l��1����v���������gSmD)�;�GV�uK�H�}�f�&��)j#+e��|���/�u]B3C��x1�f-:�}4���B��=g�X�m�2_Һag)����0R�Q��Y�Qv�=�T˶w���p(�up��v���؂��O�N����_%SMCIig�.:��f�?:X�n�J�;v��,a���N�`�����F��c�Ϣ��Iܬ�k�ʁ���T�0��R8J�!
^�`��rVa�d\]2Ɇ�%�%����|�E�t�ݵ�^QB�S�RN��Q\:�Rw-���;�wQ\�:
�q���a�dn��l�Y�G�>
���ŵW.m��&�\�b�k�z~�4��I�qE�fͪu�&j��m��a�y쎝��c��V��m���UѴ�l��ܻ ��m�Ő<�<(��1�6]��V����z8�xX�b6K�ǚ5�OM'��#;-C��x.�0�5łc�`q�=��1��=n�~�F9?��9��!Q.�ȕ��r��"Q�/�h�q֤^m$5l���4� �HD�j#��\�s�U!�q����.�P�6Vv�V�s�,#��MW�1�6�=|�a,O�a�tT(u�N
�-�xH���~��vb$"�[��#��al�c�pc$"o��ٳ��b�,shmm5J4j
���Ő#�HDK���B�9��a�ǢD�а��w����I�* %��^���a豃=��|V�}zz�يyX��zy����)��9�/���;<���%Y�����"�tcx��a��������2O���j�N@����IB{5�7���E�V?!	��8-�Z�gzF�yk/���X�X缡�+�:�Ԣb+�rk�)���s
��ퟛB2�Ҁ�0���^yi]�+��KHv�D�W��$hݰ����W��# J`s���h�!�|P��,�;v���l;�&�ş�"9h�&x+�$OX��F���o%���'��6�G�w����~�:*=؞�c+7�<�{�w2���O�n�Y��z����c���f�]�#G��轗�ek���G��k���"	�u�v�t�dg����q�EҊf���������~���覷�T�i1�ϬEe�Z��2Y���"�╽T茅6;X>`���ʨ��+�H#1VG��?#I1^�B	��>3T���j�^0A�Q��U��}��]�����4co��5;Fw��Ԡ�|w\�,�djفBo���L�����_8X��Ҩ1��cg���,[W��u���`/��;g��qL��)d$�	=��B=�	;$��.�F��"�M�i@m$�9Aj$ʊf,��q�����q0+�3��}���}��=���2��re��rOƬe��}�����'0���$����Y����C6կ���������      e      x��\�r�H�}.��e�@�z��w���i�Ll$!&��2�=�����c{�
�x��XG��UP2�2��,h��e]�!k�<�Po2��J�D�4�)�p2N�2N���#�j�βy��ۮ�e�Ӣ����*�|}�.o�M�`"��"��G�_j}�D̍���>R�7��ĩR������U�5�n����>��/��뮬�e<�WL�X��X�.�T-!k��I˺z5�b�T�eVͷ"�+�kHϸ��>NH�IHǞ7�<z���yæ�)�5�W�O�WYQAe��7��:��i~<㬘X�12��K%/k�e�}(�6��:k��l��?�e/��B^H;m�t�+��O��&,�ݙ��(f]��ߣg�k���'��)��ڦ�}�n��~_��be��>>�K'��V]H�#0~��OZe�4G=q�~a�9��Ev�>4�"H��!%UPP�ie!���L[aަ̦���,�����Er)�(1Ƌ���X�e]D�����ŷ�����!)u�m���a0N�Ǻ*�/�b�0��2(m�Q��րO6t�7��M�_�%/ˬa���uu}U������i+�4��t��4�h�'�a�9-)��%��xr)ԥ�~m���^_c���[��rs*�	���ȝ�J�K*ٴ�g�I��-�Z���j����I�v�D.�
�R�8��Kd�n{����",X����i�'��R�2�����j7���"�ۗ$�����Q�R�p�A9��i���GϳfZ�ޢ�ǥR�CCZ�<T���ç���z�&z�����7MN�ǄԉI�)�H����d�p=Z^$���O���l��*g�Q*6�4N���A��q�S�;�ȪIQ��=_�U�Fϊ&oᯚ��*�F��{XW��\�>�I����*e��i��n�Y˘�4G���|;�B/	��uS����u5�}<�9�1.�v$�����	���~Ϫ?�9���_�g�͎��]:km���)�pX�'!�̟�L�'���X����q����D�.�l۷ySó��Fɫ?���Sءv�)��|�Y��g��u��/^�e��n�7tС�,�V^E�ætX�ۢ(��Y7[��ſ���H[�P8-�i��a=�`7��36����nNX'�^b��`2���%���o�a�Z����x!y��Dxpm�HR�kQN����Mu�w#:����<[�ez)\���EN	QR8_Գ��$��V�*��oK��z@��C[`��+�E��.׫)��"��y�R�b�hq982G��{V�?�6zU�e^�bE���&��hR:�jR	I�HAQn���4������7����͓a�$��&�Ȁ��5�u��Bh�|`&D�1T66�!��_���[�����ʍt6�w6���6�M�0�U�X���1�*���؄��=qY���N&��\�_[ιLF;D�ŗ<�Mj��d�h���W���p6vp��`�Y�]��d~ʼ�qp�w�8��<��'��Q��O��Tn�2z�w�p�Fuj��Q�_��{-V$G��I'��^(�З�� �gU^�^$eby���b)<�5[��b�*��P���yo����k�ە
�#DT+��1_Mk��>�ic�� 6z�^$�S�]��e�b#�73����kQ����9AK.����FxN��D�Ϳ�����}�^��c��R��,�1|t�����0�f�*�@��E����I���-�������ր���L-m����te�zD���8Uz��c�{bc؇�*�Y�L0��6:�Bs6�fD|�n��+?~�5@���SՁ��[�!�gG�7+U��AА�A�K�����n��'X�S�Y���!z�ʂ���枧0N��I���K!�]��2�+�� e{��,R '�c ����V��O�����G��	7�lC��G	�����oX��fZt����o�`���2�*t+5`�ʏ���O��P��k
%��O=��x�W�سm+l����{������� ��&z ��ѻ�
a�xM��x��MFD
G�Np���R��p��z��&U*SK�" �k�|O�īvf^_�Pg�=�S$�~�L �2ٳy��~�0X��)�.�1�d�.JmAwK�2��ۏgoJ��.�C��bu��	y���^�N6�a����R�2
ĹYF/0�>Y	���YIYD��ށX����d��R��W�,�}��X3 ���Rޏ �X�L`��J��q�ʒ\���+��am�v\����0�d2^ÍM3����&�#�=� H�̡\��~z�O�yN4_�<9gؐ���
j�O�p�:[M���ߣWy�ʪ��1�����}��K<�ų	�G/��ė&�&�����F���[sԌ��ͪY�N�
� ծ@n$eS!����˯���΋��2�1�1�����$k��6�q_v��Č�Mxj��F{�k��Ŭf+�~���wb���f��kh�rѻ����`�˷KXD���4��^��D��p�7�%l�E�6$�T��]�"6
L���x{_�����*�	��Kxg���<�\z����T��'`��VAL h�-0��i���ʏ�Vu�9�rP�;��P K�`���,��D\���	XW�,�5�ES�6�]�
���?RX~�oZWѻ��fA�>�b��C��	����}���*�
e�5�[���|:YS!���r���T��o��
�x���A�s�LL�ʺ~�KǪ�Z�`2MF1|�,� �u���?b�#��.%|�hֽ����W�k���D8@�BS�%�,B�jȆ|p6`9�p�a��{�Hl�]�˦���uUϙ1N4�������)w��M1�JA\k=L�>`o�n�#�!��	�;ʀ໓�@�o���Z`a�7����]0��*�KD0u�p��bZf�%�W1��!t}Y��_U��'y��|�W�F<�s��OR���������2zFq���-7ލ�(�a,6(�>`�2���j'fw�Y#�*@�G$�}
�CL��i��g�Y�MO��@`zɌу`p-�n�y��
l�wK�Z�dܛY0���9��[�������[S��I�}:֧+���Y�@�e6Ep8���	��:�����*c�a���8^P
�[P���`g0�~E�f�źͻ�?J<A�y�8��3��i�s��X��"��D!PH�ѸI��5�{(�^�A]jE���	aa&1\U���luS |x����9�Ub�s�-��*k�h�����_�1:S�P��䶇����l�Gp!WI�p�P��\t	�'�h�dsg�/��xJO�=Y=��,	IDN������E��?�t�5�6Г�TnwZ?~��/o|enu`����(�������쾻��M�W�J���l}�ۋ���Y��znN�M~����3�V�Ha*�r��<��գ���=���o�[�e��Y��&�"&�/��"o�l7�=�9����(�s�RE��
�=�����;(r�Q�eޅ����X�H���k:�Z�-D��ąO�v�¾+�eT9�b�>��<�{�N7����HM1���N,`���vl�GL�^՝����k)�#J5SsrB/�]���ׁיXp+IC��	M�m�h̔�ܟ��U��-"�l��~Q;�B;��'��9~-�r�f�N��P��Ui_R���-�㭟w��vcj��.�(�:/	V�쳭����]O��"<��� �$�Ţ��V�0m��~��g��ϝ��D�>R���Q�"�+��8ƗnX;������˛W��/�><�׳ן>�/>��|�;4v����5�k8q��@��8��];�Up�}��:�~Dd¤�!���:��)	/�z+p��2�L��~��X���O#[�:M���W��2�yʕC�.�ڐ}&|HU9�&KL�@�]�[��M�B��-�:÷яS`�	�ڥ�-�t���VTW��ot�?��J�p؅1e��	�z��x�E <���¶Fw��ć"h�yNn�s��lJ��N��SCB�k   ��8���ϸ�� ���AH_e����X�ԙ�Yaej��%��M6˨��|Ej<��Ѽ�rC�� 8�`��\��W�uF�7����|��2�<a��;C��}Pqlފ8fBF�h�xUE��5�Ӧ�d�N~[��g�:�3�T����I��@L��P0����Gޯ�	��oȯE@*͒�ӌ.�wׅ�V
�\2(hEɻ��N<Wr�X����]��ĕ�Ie��Gh?z�n��5���༾�[7'�!! �u�>_��"�-U>�t"�V�Qef��D�`Z�j�M��l�u�#޷Cm��k/��@�}�=,��1Vr�*�=*Mr+��N/�ᄟU���	��g�▰Ȉ������mP�ȇ`�z1� ��u�軬���W��m]σh`�o<��a�S�&�0�z;���.w��P��`k���Ɔh�7T~ͧS�{{���|��HE�Y�2�`�y\��tt��z�c���E>�o[R��m}��.��C쐜l#�)��g�L���g��څ�����b��<#��I��=���ѳa����҇A���`1»w����ы�}��4\;#wq31a�@�hӁ��`�������ث�n�O��a�P0ٷ�.���I���U���@u�Y}u���x_�UQ���m9F�A�Z`ֳȚ���(1���	��6o,���v�΢gMG&ߜ[�W�=Ao({`�u?a��	ݢvD�m7��%s*d|5��n@n�g5���E�<\['!e��k@��/��OŬ^[Ϛ�g}����>(���9�����M�􊢐 �0���d�M�:��n3 �^�Os��,�4-���Pˆ�E!|�8�r	��0^5��3/o3:K���������[�U��׳,`�A�"��<���6�ȑ���x����!��R���bI����鮝���>rv�����RaJ?� Ľ�n��쪡�Hػ��Ҫ���з�MߟFy�5�����>���HޟB
��xܱ�?dw�Y�	Z�sD  !4�Z�T��δ꪿>�R*��bnC�Ejc `���1�ޟ_�ć;����c{��p����թG��~|J�Aqp��`�� �§&��a�N��T��� f#S��=��HT_���]�SA�s����-����A��9)=��Kv�������{D�F�CE��̍>�C�D����E<_�Դ�ş��T���Z8���j�%�&�?�3�K}�A!�#��NǞUU�R�e������	�XE�{���f��A��D�z�3X}7�(e�-�l��<�5r�V�~d�C���]����Y���_!�e$��PI
pA�c�`��\��rd���G��I��R<xU�u�[Q�ԏ� ƼT��i�u`t��W^%��)��ī0�s~]��?U�!���.��{ną2g.#V�\�$Jj�s�!�!���h�6�d��O6�������db��.����~����D������~���5��}]l�M};�y =u�,��Sg�Pd�Tӯ0mr�O;���v�x �8�����A-	��%8�͏D����ɢ߲�
~W�z���=�%��~"XhJ�`�b)<j�������.�ru����͑^Vt���8�!� �s��������l��
�ﶔ9Kc�d8��ط6�ܞ9��A��@.�]}D;��%e��~e%�����Ӡ2�z��𮻡7u	Wr�j�������0`�|�ޓץ���zK߄cNH�)���g��7��c]�����U��G��Qa�j8B�ņ[�;��	"�|�!��|D��^C;hr��0�PvIE�������Y�7扄�~kPO�Κ��'S6�n|Ɓ7t>�c�X���Qa�!��/@ ���*�a崲�#t(^z����N/�ǝ�k�f���?���8o}O`6/��ȣ�u��ot}L���L��d�U��Q������G�Pҙq��˛��%H6�az�K�y`�������a@x�nQ:�v�B�ݙw>�l��vr��}L�ܲOe�=o����r8����-ଡ��PB��`�������Ba�MU" ��� �d��$��^�0_����m_��z�̥�F�c�#.��d�4c"�f_7�
�wd4ڥG508q����,pb��:�l�R"�h�7m�> �2�"q
��P7H,�����i�"ZE��� |�4'�ц�Ȍ�.Vy}���~ɘ行WX7�q�G�l��P�$З���&�~�������������r�H`���*z��0K\�yn垔������c�����N�Yh{��pE������(��u�e��N�B�ȵ�����ޥ�J%k��0�=+��*�c��S,!tjj?<�����h"e�,7�m��̊���.���~��K�m
z8[����&̙�9-��Y8��ؕ�O`rJ��Vtx�]��,z�6Y^F��g����ܢ���7�$�N���O��L�(�_��9ԕ�):}��3!,j���+��Y5߰�_#��p:[�ؔ�`d�R`<��U=�<It�l;.<t�qz�Bz2K*��(	}��I6z�5mxC�C �ѱmz͌��)P�vQt����>��`:R ��g���&��7g�7c|.��j��L��?z�)j����RZb�ZJ�HQD�B���6ѯY�'uW�+\:D(���� t͘\u�g�@�}LN���p��úi���e�~�5~�����e�0�^�qO���1�dE� ���H�n�kM�!ō�B6@�M$8�鬡��u;�_ԫu�:���H�� ^7YQ�)�S��[_�"R�����UQ�ޞ�g�S���^���W���Ń�y�MG��N��;��cB��E�/��T��R �fpA�s�gM=+몭YFwEW�Ӻ�.ۃ�MN'���&�a�J���
8<����u���RƗ�w(��s����xC�'�m���E5�.��W����-�����!n��@���yx�Sj��&L����2��{�=��f��%	dӝ��/�ݳ]�s��g�O�seJW�f���p���vJ��{c@�a=�wA�3�j`_�z�V�Î�P#\����[�󦾭:� h���J��N:��}���=0$��x�9��\��{���������(�4#�߹F�7�I�Z0z����+�9�.�_6yW<݌s�aƄ����XՇ2{�j��R߂�}��׺Y�V���3}?5\m�s?�j;�����ч�H���.�[�e}�4Y�����r�Vy1m�+�����<�%rpgc�y����H����Er�ţ�_|�k������c�n�W%	��Dq�O	A/nX���jM��M��6YT���߶�s6}́����������� ��S�ū�f{{���/l#
/�Æv����Y�G��Q�|$�C�r�TFg����`��xn�����ʖt�6�(�G�>>���F���Ч�'�2~����'���2ih�d��lÇ��������M�ѡ-Ci�D��2���K��_��#���,�%�E{���
@��_��qۜ���{�IwX8e/�fJ��'p�b��Af_�ѯM�R�F~E���t��m�1S޶��`=�ME�<�w9�|��w����Kd�
��M����l��y�>ѠMX�S�&H��lI���ө'ɥ{��1!Qz��	G�{��Fo�����F�¤t�Y�m��r�F̋�O�r��6��ZV�s��e�ğߒ�2�	�M�o]u٬{���n%�����_Y����+"�����qPdqh�<oz�(������?�'O���4C�      g   �  x�}�ˑ�0D�VN�(6~�Ĳ�Ǳ��5�@�t���0@.h�b/�	��L�����#y�ڱ�Q@f�f@�T����,5�J=����N]s���j��EuW��2CI�7�D͂���'+Հ\���J�Os'�q���O��>� ��� x}𭨏RV+J�������ab�w�D�3��&��E�OU@�,QwdA���4�0K	
��s`<��3u��y'j��5�%+�C&�QwN�/�&���q�i#?T)k�UcՈL3����i8P;U�+ˑU�Qű5:�j^<z.�N�m�_�9�%4�D��y}����g��Q��g0�'�w�{�.<�N*��9pk��]}DC���Yf�4��e��şN�+���������u]��P�      h     x��W�n�6]_~�~ ���]�E��E�h�n�al�"�*%����J�4zP���W>���qH1�ٶֻ�e}�Ǻ���𜙇\=0�1V)UIN�)�/@��w����� ���e<6��Y�NѾ��p�}��\�������������{w�<5!�N"�p��9;Tٛ& :���e������A�:w�BŬ}�����p�}��uw*ygl�6<��^v��[��{%88�C�R��^	]_�m�		6���g�{E��-��VS��\ђ��"\Cwm]<�ܪ�o�f[Č"NI��MJAI�Dz�A�hCD�׆U��2��	D����v��Е,�VK�!���rX��1�r��D���X����m��E�-�P�@DH8�pq=^G�8=���b)0�PnM���&w�����'��j�O`�pZ��*�i!L�=��0��n��YPQ�����DD	��"�$+��P��!"s8�G�C�&Y�\����37�E�m�"~���?�*P�k�Z�r,�O���Mde�cϱ~�1�f�B߻�*E�sj�� �����_�+���Bb�fV�F���!ţ*�|� Fe9VA`�f���r��8}F�i���l�j�KY1�MΖ�9D���w�Я𔜖\ADJ�Y,��A�0+9VR�1XAD*�5x�A6����Ǻs���H=�R7�r��|�*lY&�XAD�D{
~K@m�V"�B��6��^��]����T���S��:o�W�sQ��5q�)D�������,P�'��BDa��*Z./�p���O �$�@��ɡ[�����+�(	��q�w��p`����/�D�z{�wQŶ�x�)�|	�����]$a�U@�X�/�\a��͑�O!�th�ˆ,d�����X���ۂ�L��$	5~=�L��I�<�dJa��?W�ٝ�c��lr�'!�X__�c�cXA�K�"�Ck��5� 68O>�$D�f��b��9D��=��!f��9D��a�m��Q��!�5\l|YF�ݣ۟B�oJ�_��x      j   �   x�}��n�@E��S�`�t���+E��T�Z1!n ��˄�Ӌ���&&wu��PJ�\��]�ֿ����
�m���Jc���2��)�fM��e�X�B`���~�z�>�2��o�.
=;(eگS��W�Q�F�0��t����^(D��U4��Y���Y9_������p�Ûs�;~��S �e��C����,��d�_��p�G`Xc�bS> �B{��?8Uz     