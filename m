Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119959;
	b=wvv/RGMhNhu7MRbbXlL/jQIsMiYpGKgcUrCVGZvQBuT5bx3AcsORRNk9IGtoyByV+PGB
	 RN/6wNFYQsTCSzIbJYmw9zEGeSlAdUDGj3P29AWmGX/UM7BIgZPoN7lwLUMsiaEP7pITW
	 b7ITIABdNMUiZXuBKDsqRnQl5T+UlL4p6O9i6S4tYr1GcxYzXG7Z6C02ynQ0d1BM8b5yV
	 xDmnHGYDJQ+zVUDr/1R+FZzbIsMZ1/RnpW8LVw9xqCJBBlExoO1bRrNd68ZWs6+kFIEfs
	 DU3Mns1O0AGWDIEPJpxwgWKSPWdegs/x1TF2hZKN02ZDR/4V46VecMEkcsp8jo4HB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To;
	bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
	b=3H3QtOITIpqJk7f1AT6DKwzqY6jwZbq7dRIZ9Wd41LNgFywAgzMDhbMYFEw0Tx/OKnYd
	 qFXLkGzRwMFF3OtThYXgd2B2HBxScNhUdboFP74LHAcNJc47LCae70qZVqCYK895Wb+k6
	 fCw5RVBwNjGv90bs6yUaZw/q52FzhQ4svYgYXbKt7lBUCzh1ioMgdBO8057GgqFqarIHf
	 +p7VLfUezob9jOp0zqIEv6j7TWVxGLMiMO9PTzL2TKmEWnsmjtQz3MKUqn4XlrdjOj1CF
	 GXUM9NUroOssVB5/mAKByOgrHEuoel5zl2znuCPKR/F3bSEtRtHK30NrVc3CtvK+TNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nneFFonO;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74158606A31D
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74158606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nneFFonO
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a6cc9acbeso46052d50.3
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119958; x=1793724758; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=nneFFonOyaxPp8ON67zNa24silU+4b1eigQUcY9utjLn5IpigP5PfkciZlsej+JacP
         b4gWKsQhauXOLWk9OunLVoUw+fH1y6REiuud+x8JNxFnGOKSs+S78lzPJzalXHWSC1a6
         j5+poTwY3Pwg4IAeDwqXN/sWm35HTvxF83Q4pyCGocE19cNvs6xvQvUzulZr0qmaGKzs
         cLMyWKt+mFh8jqS9cm7xxZNMI9tsoIYK4O7AtcXG9x/c1PhZFXmm5YSX1ivSiul1IVFd
         On5WC9qZtpNwpqYmIRNX3SQnnxi4Rzc3K+Wkd0HL7vjclQiWWzlHRlP1g1Ib4MraR/Jm
         CBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119958; x=1793724758;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=c8IBim51tVbLTrkJ9obruqSm1ohnm1fImpT1SH57hKGm4HlLk6tbEYED4FfdqQrbVn
         QfugDq42i+yAe659hzTSqh7PWzbc84B1Wh1ye0zKaWtCPDdRBJePn3YGt0yGPaGye5b0
         9jr+cqQFs0qMFtlNnhuFf7BJkZzy5nIE2XG6f0UQ3lgipcAmoU0K1XAtNn1ofbyMReoc
         JMbKomoVu+60OPNlxeyKqcUvuFccG1jICeyj24F8GNBoYjTdBsVbAKlPdPqi34UAld2Q
         F089lVzrqzax77gaC1LJcI3zNbaRQubJrO+w9mvJkKoUhfIJPuxqiI1rLGCWf+83QXNZ
         SZmw==
X-Gm-Message-State: AFq9FYJI/2hFgr5kjfNdpC9FBfxBQ+V7EJ3BuW1Ij1FQj+p31RBvTJVf
	HutBmQbUjcor5d8jFyTjeZs1xaC+MrzlhWbi36+rOPz+JJoU+rGQdhmi
X-Gm-Gg: AYBFou3gPgkdeH6jaZ56LsWSMmEL/UXt/9tnto6/6cQmysn5Ize1h4nN5kFBBI3CgCs
	ZIF4DPM343e+YmwZl2ITX06DB8sDDotaGOjfqa1dQaQCRRszRV/NFzYlfVltvzm1szgaqKucgRa
	2r7hyDznscXtMQO+9XyOJtJBT8TKrx7yjRviWKBWGGkcZ43ffNxuo1Cs+YUoVX+u5uUkRvWj/ec
	P1HQc35ekESI2vzC9Po7AYK6Dlzv3Elmp78DLdQ+mzaU955u4YVZLKLY0tlnrL4NhNQ0idb/wCH
	r9xPwqShiKZmjC8rphy/RNRwsY1LUFDCcN7/Hs92NQ7+KRH6IaAu18ltXFZeq0WjJ8B/k7F8fwv
	s2gLzEc3suhESG2e5n0M/+U7KDwFDYXX135TBU6ZpeNqW3WBKZorkjsYTUjREvQqBVv85aAUioQ
	fIM27b8cVbBsGESVkhyroOZrWiYJiMQaC05v5C9MySW3j/jwrR6xsMzW3TrH8jqAFNLmKldlF1v
	tPhyxe0vzeG8TUsgO8B+HM+1nxYX+rc9Z0LhoBVXW+Ob9C95+abK2uwbPQkju7z06H04xbEI+jF
	F8rRoZiqtfR4V8CKJSTmNvhDWn/Frv+8CfiuXLfU//DoNldT7OFuq+014NNTiOpI1WSjqiL9CDt
	RmB3/lPMcV85N
X-Received: by 2002:a53:e7d0:0:b0:677:c8af:d149 with SMTP id 956f58d0204a3-67a7bd1804fmr61705d50.74.1793119958354;
        Tue, 27 Oct 2026 09:52:38 -0700 (PDT)
Received: from localhost (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a080d4csm425545d50.4.2026.10.27.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:52:37 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:52:34 -0500
Message-Id: <DMFRZ3B3A6CH.P7SKUZSQR23T@gmail.com>
Subject: Re: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event
 enable helpers
Cc: <chrome-platform@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Marco Elver"
 <elver@google.com>, "Bart Van Assche" <bvanassche@acm.org>
To: "Rupesh Majhi" <zoone.rupert@gmail.com>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Andy Shevchenko" <andy@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Lechner" <dlechner@baylibre.com>,
 "Guenter Roeck" <groeck@chromium.org>, "Jagath Jog J"
 <jagathjog1996@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jinseob Kim" <kimjinseob88@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Remi Buisson"
 <remi.buisson@tdk.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-9-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-9-zoone.rupert@gmail.com>

On Tue Oct 27, 2026 at 7:49 AM EST, Rupesh Majhi wrote:
> veml6031x00_event_enable() and veml6031x00_event_disable() call
> veml6031x00_set_interrupt(), which needs irq_lock held. Their only
> caller holds it, so mark both __must_hold(&data->irq_lock).
>
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
>
>  drivers/iio/light/veml6031x00.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index f6308498e422..476ac3717f8e 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_d=
ev *iio,
>  }
>
>  static int veml6031x00_event_enable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;
> @@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x0=
0_data *data)
>  }
>
>  static int veml6031x00_event_disable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;

Thanks!

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
