PGDMP     :    #                v        	   artograph    9.5.12    9.5.12 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    33700 	   artograph    DATABASE     {   CREATE DATABASE artograph WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE artograph;
             kenzie    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33701 
   ArtistTags    TABLE     �   CREATE TABLE public."ArtistTags" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "tagId" integer NOT NULL
);
     DROP TABLE public."ArtistTags";
       public         kenzie    false    7            �            1259    33704    Artists    TABLE     q  CREATE TABLE public."Artists" (
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
       public         kenzie    false    7            �            1259    33710    Artists_id_seq    SEQUENCE     y   CREATE SEQUENCE public."Artists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Artists_id_seq";
       public       kenzie    false    7    182            �           0    0    Artists_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Artists_id_seq" OWNED BY public."Artists".id;
            public       kenzie    false    183            �            1259    33712 	   Favorites    TABLE     �   CREATE TABLE public."Favorites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."Favorites";
       public         kenzie    false    7            �            1259    33715    Tags    TABLE     �   CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Tags";
       public         kenzie    false    7            �            1259    33718    Tags_id_seq    SEQUENCE     v   CREATE SEQUENCE public."Tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Tags_id_seq";
       public       kenzie    false    185    7            �           0    0    Tags_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;
            public       kenzie    false    186            �            1259    33720    Users    TABLE     -  CREATE TABLE public."Users" (
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
       public         kenzie    false    7            �            1259    33726    Users_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       kenzie    false    187    7            �           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
            public       kenzie    false    188            �           2604    33728    id    DEFAULT     l   ALTER TABLE ONLY public."Artists" ALTER COLUMN id SET DEFAULT nextval('public."Artists_id_seq"'::regclass);
 ;   ALTER TABLE public."Artists" ALTER COLUMN id DROP DEFAULT;
       public       kenzie    false    183    182            �           2604    33729    id    DEFAULT     f   ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);
 8   ALTER TABLE public."Tags" ALTER COLUMN id DROP DEFAULT;
       public       kenzie    false    186    185            �           2604    33730    id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       kenzie    false    188    187            z          0    33701 
   ArtistTags 
   TABLE DATA               U   COPY public."ArtistTags" ("createdAt", "updatedAt", "artistId", "tagId") FROM stdin;
    public       kenzie    false    181   �+       {          0    33704    Artists 
   TABLE DATA               r   COPY public."Artists" (id, name, email, lat, lng, insta, region, followers, "createdAt", "updatedAt") FROM stdin;
    public       kenzie    false    182   !1       �           0    0    Artists_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Artists_id_seq"', 116, true);
            public       kenzie    false    183            }          0    33712 	   Favorites 
   TABLE DATA               U   COPY public."Favorites" ("createdAt", "updatedAt", "artistId", "userId") FROM stdin;
    public       kenzie    false    184   �J       ~          0    33715    Tags 
   TABLE DATA               D   COPY public."Tags" (id, name, "createdAt", "updatedAt") FROM stdin;
    public       kenzie    false    185   "L       �           0    0    Tags_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Tags_id_seq"', 52, true);
            public       kenzie    false    186            �          0    33720    Users 
   TABLE DATA               d   COPY public."Users" (id, email, username, password, lat, lng, "createdAt", "updatedAt") FROM stdin;
    public       kenzie    false    187   UO       �           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 1, true);
            public       kenzie    false    188            �           2606    33732    ArtistTags_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_pkey" PRIMARY KEY ("artistId", "tagId");
 H   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_pkey";
       public         kenzie    false    181    181    181            �           2606    33734    Artists_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Artists"
    ADD CONSTRAINT "Artists_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Artists" DROP CONSTRAINT "Artists_pkey";
       public         kenzie    false    182    182            �           2606    33736    Favorites_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY ("artistId", "userId");
 F   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_pkey";
       public         kenzie    false    184    184    184                       2606    33738 	   Tags_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Tags" DROP CONSTRAINT "Tags_pkey";
       public         kenzie    false    185    185                       2606    33740 
   Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         kenzie    false    187    187                       2606    33741    ArtistTags_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_artistId_fkey";
       public       kenzie    false    2045    182    181                       2606    33746    ArtistTags_tagId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ArtistTags"
    ADD CONSTRAINT "ArtistTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public."Tags"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."ArtistTags" DROP CONSTRAINT "ArtistTags_tagId_fkey";
       public       kenzie    false    2049    181    185                       2606    33751    Favorites_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artists"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_artistId_fkey";
       public       kenzie    false    2045    184    182                       2606    33756    Favorites_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Favorites"
    ADD CONSTRAINT "Favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Favorites" DROP CONSTRAINT "Favorites_userId_fkey";
       public       kenzie    false    2051    187    184            z   :  x���mr-)�wV�\K�Z���I�D��j���I��	J"�1B���'@g��ߑ������ɿK��,�d=&�1	�.��
�+�-����{��R1�U�� k�)@�&�#M�H��O(�v��X���{�dk�R2�E�F8չ�Zm�G��A���)��t���=�kPg��%ԓ�@A�D��&�WZ�6�C-���҃��U��*Y�$��.��ݗ�z�J�v+$�q��a�Z��Lv��I񂽱�Q���*�R��H�̴�QUE!�v^�LKȳj�X��\�(��B�h��Ĥ�:P��Y����B�X����KtW���YMF�CbI
�Y�<j_	�@���`o�v-����p%^%�x�;X���y�
,v� �A-�'������7p�p�
e^%�2�}��|�h"xg��R}�b��֦����J8��}8ÀW	�ESOR��J4�^;g)���,\����.�֑:�@i?����F�?�������pv�(I�Ck�I�}Ջ���{���M���ʁs6�U�#��9�&���X�����΂��0�Rڣ�[7=�F�B���fG�ک%��j߳��s��vKH5
Z,��3¼�X-v�@?���r�{tO���ƥv|��]%0v�M��9&id�����\����
��nv��~�F��ʯB�,��c%�31X�%!��3[	�8�A.�J)sUI�s�J4�#ŴQKy���2c��&�#�+����M�q),;)e�l>vI��	���)4�bC�ͬ���oo4]��Y��ٵw�Ul��/p5�UJu=8����{��9���ۥ*��5mNK�t�G�ª�B�-P3bj���u�d��U�4-1Xfߢ���mVƣ���M�[I�bW	��V�YT�.첬64�$�Zb܆$nVƆ���r�,]5.U���b����!������r���h�t�@�J�[w�eA��=�#��^lW��#��VP�RN:ߣ:xN�Z+^�Ɩٷ��\��O�RYu�27��\r�j�~�������+�[�b���T�q}��g�d�DM����"k]��Z}v�d��0�{�ŮR�"0|�Kj�m��j�v���f��T�}��xm�g�F�:B⦽�a��|au�-�j0�Yև�� f��>V��Y4��촬�]��BM_r��h_;X�k�n`���Z��p�&A��\4�<kRTQ-$�3l��7�X5�B�S�o���yW d��_C¬~`�R�����Z�Q�F>�%�z���ZH �D�W���<�V�焒-vQ ���C�'T�މ�jv"$ �%�ӕe�a,�c�5���}숬���ǿ����      {      x��\�r�H�}��
��K���dY�۶l��i�LL$!"��2�=�����?�'� �I����U`�*���K�+v�5�販ۖ��SIl�v��3+�T)�����l����ď���G�����ߪ�˧�u�uyˌ�x&��}�y�����J����ᑢG�;�<��Ư~§^�<��[���n긛�Ӧ��:�}1[fEO�%�i����I�Μ�. �r:�=�}��S!O�=^Hn�#N2b޻���j	���UK�NS=����i���\��lZ/�+&�^�l��I�C�C)�.��4z�W�y�J�o���Z1�c�5$�a�HR;���M�Yf�O9m�	��s�b#��OF�߲*��ͫv���䌝I<M�qJ�5��iKǵNy�U�X�U����{�ʫ��.�&o�.�Y^uE�1�%t�uKll��ʖ�/�r��b�/����E��ʺ^�u�"V61V�3�UK�`��I˺z9�b�T�2����{WT3�:�ڞ�l��Fy���9�fћ�Z�0@\�s�~q���iδ��I4�&��H�
�i���p�&[�W����u�,�jMj{�L�\��*��z�3�]�U�Ȣ߳*k��[���I���i�PZ�AՖ~�4kJ�	�Xu�(�%�O�$��s!b�H�ı���|,;4w��2\��R,��x�v�c�H�4ߝqp��QG�}%�kv0a�]~�U����+�rI�YN�c5�;�$k��6�{+f��j��7<ʞ��I��s��~�m�u�5������_�y�mV�L���c\i`]�,����[S��Ť���b�vMVGoo�P�����fS�>[5yգ��
�U���%��{7�f�#c������#�XGJ���'��7�j����[U��ۢ�����S�p?Z+1�<��ER�x6Ӌ�Ll�w�9'8�gWM��E|Z�(�c,Y&|���,AH�`D׭�l����|�M�sɹL�Qb<�
�~k���F/�f\�^% �����U�,��e"%+��q?��ݭ�W�1����&'�w���Q2��'@������:���H����V9�����+���͵z{%��2�9G
��������ƺ����ڕ��c/g��r���˦�e��=�Z�4�<�%θͦ�~|>���F*X�o]V�!M*Ry�8D�$���P!�9Sl�r��f�w�Q
x*�S��Yjc˰��r{*���ڧ@'aB�e��B�i m�}D�u3.����"��-	���s�����Q?z/�q�r���&Xb�E��G@��,����^�u5���C�x� �S�\�ig�d` FK?�s)���;a�:�V��ޔ`/�	X+���p)Kb!�d���5��)J���N�5a�E���=v�s=�ޮ�zʌq��Ƿt��b"���@�T��Mq1X�0���z�OULw��9��_'-�ۼ]���
4
Hŭ���@���=7����0��^��b
.3EP�M�kw}��eR�#C/���Ĥ=��@Rk�, �o��c:\;!�_�1������5�$g��훺�C9`�F� �p�<�#/������@����Ԟ!�3�֬#F�ҟT�,� ���H���Y�FD��	Ѷ)rG���9���҃gb㲞,F`�}-�I]�䑞 ��I��",{6���I��b��xn��Tj9�_�qJ�\�����8�A8OPppm�	3SŮVM��=R!����~��t�����9;+��?�~!ར���<V�C�$Hխ��<���da��#����_�8si@ՌF�LR¥c��!��0ﰔ��M�k�x :�W{��<zS�f`8�θ����c��y]o<&��;L��P@��9�}�*�»�'�����&�ab0�$��7E�WA��m�o��]���p�AI+��+lJ)������;Vb��GxD\�M�z��:k�F(h.�!�O. r�5¾��U�>�#�������Ot Gu 6a��ї��c�����Exw�<��8��7l��>l�>ed0^0ހX��=m�2�B�C��U�UM���5T(�
�<�b6ܿx���x�a�
�#�|` ��g�u�L���e��y7��n��>A^E�>������4�]уPX@ř&B>�W6�� ��F�/gM���YT�K��/?G�W-��Yq�H��n�m@I>͋2z��������{2A�S���~	Q��0ef�1ᰇE��v����^�Լj��ܶ��)s��b�?�km��)�:���v�nO��6�<�̚!؎�F�d4�t�<�T�^�iV-����I�:�� ��:v���W>��o��*o����"
�G;i�����Wx�1 >��Ó:|��������Iq0:=�����@=���^�\���$N%l�38p�v��F�[�2o3�c��i3ϋꌖ�&+��!A��� ��a��6�m�O��&��G3vKw�r��;.����JY�4�8I���Ob*v;����RDj�q)�aG�ϵv^ڔr��a�דf]z���	x0
�y�M9�E��-C�-,�.W�1I��4��M��5%�,����w�73@xI��mn��DU i���4�?�68�����#10�hF�e������:�X�vV!-�c��ҀJ�؀�
�6)�]��?�T-���HD�	(1���E��^��M	 ��Ur�h9d�Y
�,�ޠ�f���6�&y;����ٶ��X�g(_.���>)�lYD��U���[z]���^]KlB��CEY�������q�er4{y��W���h�~b/<�P�HIU��X����H�P�O��3Q:#�8:��Q�ƻ~�7$�uA�{�i�z�4^g�ٶ98��I�|��$��Fn2aO��ߪ�>�,N���tJ�s�5�7��f�]��� ��҄�ׅ�s�,���i��=�_Ôr��C6���"��+����8H;5�|>|8��#�u��������g!+S}4�����7S+{���/�5����1T�#	brz�#�{8>M��<�C}-*R8h��rÙ�����BƔ�4�¿�����}�鯫<�ڰ|[[j?E�|�0�&Xo�	"���)\���v,r�*�Kk����<x�Xf�br�-rv����o�?�Ȼ���晓 ���Cx�fo�*z��#�~�)��/UR�v^t����d�U�)I�㖌q���w���{�����	�
7�t��b�!�3�Ψ��*c�P*���e_���Y�'�ts,����]��A���'sJ������4|�d�ݣ�R��5�L�~�6�������t��oTzJ��<��PC�:4l<d��}� X-�EU1���>@��#S�x�3q��b�x��H^�Um�+�f��C�h81%�$BQ?BZ?�:]6���$��D�g�&�^f�|'~��`ÂҢ`��.������l2_�y���LN���K����E�1��S\�R��P9OYp+��gy����x�BEX�S�S�eK)���Qu�͖�O���UIYm 2���#{WF�˻�����c���V�����2� �B ��;[�}�nOE��"B��Hl c���l�=\F4�'$��=�M$Y��o���^�YѰ��c�~l��t�n�� b�<��3�s�Ҳ1�f'����)*�<Ji��^�G5T/i�t5�k�O����Sl��{�\!�[�͞}��N(��>��+��ua�-�Z�a�nk�̋1��юSg�N%�Y7c�C���������u\�S
�T�U�M|�7���F1��]�>���B@�5x���i�N<�l���:V�R>�/·d˻�i
���o���%1�~��;��be7�oF�/ �T�J�J����5���X9�&���M��X��e"��C�����~�����t7 I?��FN���h9�DUӚ�ͼͨ�	wgww5����hF�eC�$j �=��jn��i�ܜ��\�K�j&fg�V��������i�d|(&\�S6T��$4k��<����L ���}mF�q.��6b]T(L�P(T!�\W���i��VK�����l��Ugk�ُ �	  {��k�XQ"�R
A@bU�P����bV��M���v�$���<4��n%���r���r�?��\(	X�Ä��G��j�o��6O�Q�EYG������Aݩ�8e�$�gaY�]*6�*~J��>4?�s>+���*�ʻ���K��#,������V� 
�|������]QEo�����J,�!..�N�/�����~k_�o��Y���Bppv��}�{�P� ��߯&���_.몢zn��zn����DtT�|�4�����a�Ӄ;-9-�)uA��]�p|�i�E����!/����M�M��Ϧ�&�=S����USg�	�_�}��o�cﰐ����.�.�|���Ӟ�v��[MK+��	��(�ڲw�mF�}Xʱ��/�V�������`��2��>¢tȁ9��+�����W�#��',(�e�B}}��m�^��|C���С�Y	0��bݴ�p�ج\U�l��^�R�RT��[ђ$�̯H��>�����N�J�o�J�N#X�P�ٙ��q�'��4ISX��D�=~ý�Z7K�*!�)(t�6>�i��EN�Q;/o63��k&ƞRcRC'�6���(�������H�m򵉪�g�Y�ȆՂ	�Y�ї��l�;�3��Gk/(�VA�~+��}�������G/I	aI����C���O�g��w���?����MC'I�;���6φz���q `F�;e�~�����ku}q���o>~�/?�{�Ɏ��Z�>���݇>���@zRA���Mh�����="���.!�TS����D�J�U�0p4������z'(�T���w:��9~� �C�̆R�gb>�q�&��0$աp]�)���hFߖ�os|_s80"c�<�v�����s�ݟ�zq�{j��CN)�Ҥ��X�����#���N-X�N��[+��=w��J(!V�%�:�\�9�%8v�7�3�:5�D���t��`Y <�RPW0�����+�袚�Y鯡׻M�1�M�zu���y�F-��y�a>k��#ff�N��\�H��ċ�]d�T]4�(_�@8ʉa���&��	�,Lx�d��Ka	�q�V)v�55p���S�����v���:E���K�+�J@W�O��<N��uQ˪��C���f��>�Z#��4k�
�u�3s5��<k���29����7Ici�D�]��d^f�px�PÄ$�Gg��K�b9�1c�|��f;�>�����쓒*�bw��f˖���F��}�EqE�:6Va�԰+�%���EÆ���y��<����=�:"/��y��>��\t�ES��>:	�k���|yLc��qx�<LmM�]:�ԓ�a_���'f��<0S����d:��fu	^�λ�����0cDS�p 8�'{�!#�q�7EY�g������.�dt��8t��$q�6��{[�+Z0J��[܌õ3�i��«qO����:��gŨ����5	��=�<�Ii�>����%z�j��5������=��:���*'�	Z^�I���?�KZ{<Sy��PY"z�~]"c�r�G;���G�`�)��堁�H�N������9��a�;	���(�^Q�C�4��wU��~͚?�Z�op����+�x���08њ��t��թ����� g�B���'s�&P���{�=��� ��M���`���J'ܦ�Ve�B�y�H���->Џ��xY%��~�.+:�?z�`!��z���]�t�sPKD��E�1�Lx>�㒧O7Y��w���1C�~*�k>�#���؛KRR�(�!��h��s2�K�f���@�9��=�~>�y���+�ۋ�{\?6k��?�a�m������O�8�[0Ȇ�
IL��D�K��m��E�І�&� �a�u~���Wi�؎B�GS��#��K�O\"f���|�X�Q�����Y�
�9u��AS�j�{9> p���r'��U����p��M�P������I�_�P�P@��B�c����h�;i���=��f�x���z���Cw����
=:���_( 
Q�´�}?� ?M��x"��ʻ�;L+<>��N����O]��w�dѧ��ބ�f5]}�^�v��ɪ��)�W�"��C����
(�'1�S2���L �@����Qa����]YC���0��6�^��v��M��.�b	�I���pm��*?@ ���=�6G�w�0�p��7�>�a+/�߳����}ЧE�����\R2Pj�9=��a&�(Ǥ��ȏ�|�����X�Y,�+��A4I}�t"q��־3��6/��Yj7.�Jn�[B�q6��~:(�o��Ϥ���?�w[�|�'H
���C�˻yQ�ч������/�p��DF6�$DL��N��['!E�_�^rXx���$ O��	��?����;��!      }   @  x�u�˕�0@�5����߲j����$����F�ڋ�I�f�������<�fM�D3��$��
(���d�4��m�$��:L����@�z�M�J�I�B�2��)�PZ���`ȕ��Q��Ỽ�9e&�'>�ʒ4
�D<o���n'��:K2�����Q���~��j��5���P���� /�Ԥ"�W!��ū,����y�5�Em�tN7vK^�Q)`:��fY�1y� ����$�Q��5V���d�Q@�Ӱ��)��XNݪ�4��d0-Z�M~�~���M�i)7��������]������]����-�������<
$h      ~   #  x��V�n�0<?~�~ W�ҭ��EѢ)Z��^��	ˤ@�1����.Z�D)������-CS��k�Lc�6�m�w�F��!�҄�B�B0LU?=!oN&�R�� ���z	w�.��v�d��F�J�6�ܛ���Fzλ;�tؚ=�p_������N�cR����
�C0���i�����[�J�86�6�"�i�u[�Is�Y�}�\JF����G�۪A��q��U��qq���o��д���WHСM�??}�*"��\��<x?ے� �-h �Rhε	����w�ZQ�H��nm�� �|9��b
j�sڹae�3�T��8�ںs=�󂧅�q*�����-�E�� �����g���ګ�LC��R�g|Ae !.`o�ɴ�9ť}�ΦC q	�R5�D�r{�Z�7a�/���f���;/�W����x�~e�����	�>�I�c�(��\�8�� ������ӞK����a��(�.�AH���o�}��"i����s���w/"K��g�f�A�����5�*Y�Vy��[�C�C?�y�#�E�����s�z���R��8A����U�/�ɻ�-rQ n�J�2
M9�_vt!
*��)}!���Ɣ�L ޒ�|b�3	[0q��
a�Ir�3		���5H���d�H�b�fbډ	�D��R3��4���8�T�;1���N�޻5�.�[�Pp���Z����9ܝ�vJg]ñP�!$	4Ng�3^�<�������Z�f#�]��,?���sx�O��x���N�%� B?1B�b��      �   �   x�3��Nͫ�LM�/)��-vH�M���K�υ�s�%�X��&G�;D9��{�E������9�億�z��;�&��뻅G�y;d�&�&�r��������������������������!P�W� f+-     