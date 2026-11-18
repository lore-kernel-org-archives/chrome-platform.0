Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031370;
	b=eKrlrZlbNRUy9lvlOhtf01I2InlWfNmeQIEBsMqF/HlHI3QrvOk9cPDSTXtwIW1U1puN
	 H4wEFu5NcfCBLC3HX0u+d2W7wiQKW7xzC18dehvT+uBeXgiBQmLNbz5cOK3aK++CxHSRb
	 YLHHjw+5dD2OnY1DWwBFthbFIjk8RmDyAkMJ9dGGSVR5txq5BS7ZiacyrZEmpYsxDti47
	 9xV8yNJwxOB5A82nf0ps/tSpt6AvQtuR1hrsrRk4njRWDNNMGaV39K23B2cxLhjuXitdk
	 MEUdi5PdTHKJ8KEo9JMJhL9u3geqsP5SzF6/eo4aIuCJzzTvbAvCmWfSM80cqzP6vEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
	b=sd792a/rWuU+WQF6dx7wWwYaUzRNO9nGfADjPmBVqBflYqc9zICytdm50NBkJeMeJnk6
	 d5kqcRpgXqMfeTInGvm5HY91s8hUy7tRVqvM1lcwTsqSyVv3BmVwtlZlUg5MGg/VXa/f0
	 ysMTe3r1VUpQEpz/jaQY4DqKOzcUOTvTcW7rHWRbgpxTlXZgtNY5+7JKK9O542gSj4R7v
	 kL33P+Y5Z8cqS1JpJkD6CN7Oot4wKw/87nXcQWwq6qxXpkB+XVtI0AU4M/jLcSk7lEvB8
	 Gzh9lmpqR+Pg5e6izJ3qgRm9xwGruGpPDw+B4VyjGZb9U8ZI2zqK0grEOBh8KIXuQcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FLdknH2T;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED4606A331
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 19:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4ED4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FLdknH2T
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1015558a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 11:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795031369; x=1795636169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
        b=FLdknH2TS1GgIZm/eKJTQ3nrkJB828nIcFHiLJawXMmmEkFTGq8kWGA0pAGtFhrWic
         N9hTTbXBT/dPpYlGurKHh+uXDv7XlOtFDpsTD0InIPLohgdcT3Dc2rb15e9cgUEZMblh
         cst+fjCjy6wBqCsmNAd+414KUHqAbb1ywDDs72gQ9v3Tjkj7ZkZgNUVl/YPwwwn97Ywg
         GnndZgdvn8vRfFXe7GZBZ/63rIPOkf3PVdSn/XduMwQ7iOVNmJXDH0imMoqkZIk92/H7
         9Bp6XMYcMn8oDRu8YP8kctX7b8ttmT1KmaOdcQPENIA6bItPJ5kf9GnnaWYcKX2zkESu
         sV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031369; x=1795636169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=begQ9EMChlypyub//lxO47pq8KY9nrGwe5BuP1Bsh/I=;
        b=f2uMFl2eCLO7z3M+NxrD0C4aG60VSs47Iq4WnhfvTIYxb3zuMLP60Xvztvfz/tNQqM
         X060XtUnA6TvFGZr2NJq1Pnty8+FmeHuGu+2kcxJQQ16E6G13AZoSZzQ7DthCF18mvoQ
         hSy+prbMNwFFBfQnWXlsyf6/70aXHHZQYVQe707nTH/MPM9oNMCvkXElsiOwCkzz2hmA
         lrBEeWyYtLsJYEdtaaWoKFa3J+XKhKgjcKFKVUWN35cFAbEn7sSiQF/+cUuOoZYDVzYE
         pusLMPyGBRWAsb6w/vI6ZP8SYbm4Pii8fSRUVZP3rJe1EzR035bz5V6RBLbkV+4J/55v
         t4mg==
X-Forwarded-Encrypted: i=1; AL+hErHlLKs6zLUN/5rFExdxnBsEMEc8g0UazOpaAP9jxSdQHBGGdqD+WYCuOrPh8VOaewV2orOgY+HnETd8ev61Rl4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+l0PsOFp7miu1rt6SJ532Cmn2gcd94eZZH5v+8Nm17hKMyMAea
	BBm+gR+LfmWZ+xZcjQwfd+2CQumqZWj14o9pLlpMGtwxs+AJBIhEw3ycvFp9tOO+//syDuwg2w1
	6hx6ALQ==
X-Gm-Gg: AYBFou0T1/adj/UVYMpP8i/kdaHCCiNgjvaLJo7brKQMM0N1VmGe1AZWWFG9jTWyCQa
	UZXokcEsttglKRa+Q5Fj7ZMme4wUf54ZL4vHt6WLcp8v3bkD+BATSUbQHIVFyf7LAgNcYqFRNww
	UEsQetK2jwpiUAgvwvxzWrYgy9GI4orjpeHSttlGlsGY0etr+5pYNCRmS3O3d/ef/PJR/9U3TkZ
	KX7xbV+VodbJ+IRIM53Q6o+mnMyskryDnd1070IueDVc+9ddJ5TNYrMDc7oswuZa+c3rocFDeuN
	5drM61PP07RphRjKPQ9VxDaR96Dgm+6AQaYgIa2UUnxfiinsAnJoKWwsETbQjg7ZNRFGJJ06Fea
	Ywfz+hOl1l6Mq242Rzf2OAldrXf/WhKa5ovKC070hjVSWnmS1FPxX2DhMvN6pFf6hZYHpg3fgwR
	l1nnJSST5GjDDQJZnQmosXmXQhf70YSdIKINsBB5YRoHBhA1gVPWMiFEKI5HU2lN8P23onF4bjt
	ZRyp99G1jkOxbSSoNiw+fjBUHYaF/SpMr+5d6UBuJkL6npbkWhvnF5hoKXUded6gEV51Sr8YjhI
	Z0rWeOOVRY1GPo/afTAKcsLtKQPnrLuw0kp+xOtgJlW0FhWNlepCEWmlBXrJaypzEAuSgzcy8D/
	b9uIo4K4won4PLpvHUU+c2/G3TsfOwA3SJxQm9+/rAv2JlAp2Z+gh6IqSN/Ru9guSUb7+L37l/S
	MC+vH2Ds0kuXeI
X-Received: by 2002:a05:6a21:7111:b0:3e2:9f41:9f63 with SMTP id adf61e73a8af0-3fe86fcbc67mr4347212637.1.1795031368444;
        Wed, 18 Nov 2026 11:49:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa28esm1692268b3a.17.2026.11.18.11.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:49:27 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 18 Nov 2026 11:49:24 -0800
From: Benson Leung <bleung@chromium.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: wilco_ec: Reject out-of-bounds property
 length
Message-ID: <av4BREfkXS_6DWkY@google.com>
References: <20261118101555.3467162-1-maoyixie.tju@gmail.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+/jFHw+uzl8JT2D"
Content-Disposition: inline
In-Reply-To: <20261118101555.3467162-1-maoyixie.tju@gmail.com>


--0+/jFHw+uzl8JT2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maoyi,


On Wed, Nov 18, 2026 at 06:15:55PM +0800, Maoyi Xie wrote:
> wilco_ec_get_property() copies rs.length bytes from rs.data into
> prop_msg->data without checking rs.length, which comes from the EC.
> Both buffers hold WILCO_EC_PROPERTY_MAX_SIZE (4) bytes, so a larger
> length reads past rs on the stack and writes past the caller's message.
>=20
> Return -EBADMSG for such a length, as the file does for other bad
> responses.
>=20
> Found with a CodeQL-based static analysis tool that we are developing.
> I used an LLM to help write this patch and a userspace harness. The
> harness runs the unmodified properties.c against a model of the EC
> under AddressSanitizer. It reports the copy for lengths 5 to 255, and
> nothing with this patch. Not tested on hardware, only compile-tested
> with W=3D1.
>=20
> Fixes: 0c0b7ea23aed ("platform/chrome: wilco_ec: Add property helper libr=
ary")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>A

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/wilco_ec/properties.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/properties.c b/drivers/plat=
form/chrome/wilco_ec/properties.c
> index 9951c8db04da065..4ca7e874804c28e 100644
> --- a/drivers/platform/chrome/wilco_ec/properties.c
> +++ b/drivers/platform/chrome/wilco_ec/properties.c
> @@ -70,6 +70,8 @@ int wilco_ec_get_property(struct wilco_ec_device *ec,
>  	ret =3D send_property_msg(ec, &rq, &rs);
>  	if (ret < 0)
>  		return ret;
> +	if (rs.length > WILCO_EC_PROPERTY_MAX_SIZE)
> +		return -EBADMSG;
> =20
>  	prop_msg->length =3D rs.length;
>  	memcpy(prop_msg->data, rs.data, rs.length);
>=20
> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
> --=20
> 2.34.1
>=20

--0+/jFHw+uzl8JT2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav4BRAAKCRBzbaomhzOw
wlEkAP0YtE3meJcfIV7SsU4KrV51INSVwLD3S2Ab1AIQPT0mUwEA1r1aiWdk5IZW
rKBNkqBRXuxitQ00OlnfA9TFU5KdbQw=
=LwpG
-----END PGP SIGNATURE-----

--0+/jFHw+uzl8JT2D--
