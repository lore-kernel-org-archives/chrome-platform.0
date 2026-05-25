Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9E246778
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673190; cv=none; b=K/FRSftKMqq+VwCytQObRBOsYbkh3/Y6gJcjshuENPVXRRYzoS5PMBRD/eoBsCNFfynBY/GCmkiU3dcIXrvgTK5StFFbY6h2gJrrfm7Ux7AG9oxBrQvn7S5MJrxDjM6B/nSznV3Wjeb7pkdKjlidwXe7G7fL2sxsvYebMGEKeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673190; c=relaxed/simple;
	bh=T4Bf5vbSPVSOe3vw9rQJwnz9U9F9C23dWoMfCegfy7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1u2c+HiNinl1iG0fnELZnnfN/rFFNU++4aqpNUKbhJp7FYZt4fDRlp7/Vz34VxnEWU/z9uzlat9cROTIZyOHa7dec/AFXSLV5i3xBlpLCD5j8txY/GKIVE2AxbLuugBdnyKM6c7CwsLalllsiigUgguAngNyXu74asbqI2cZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l/66v1gv; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l/66v1gv"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de46b8e432so8544471a34.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673188; x=1780277988; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
        b=l/66v1gvt2PTP475Mdhe9VpZ6cgKTTT9vdZMSkA6Yw8ESeB3+Fd8wg/R9zOU+pooYu
         dk7tm4DD9LfmVJZZZJxG+N6i+wwt1uzeSOFBITea9xywslrzza7/nmH7h6ElHaAU7kWn
         F+POkK25DA3/trBQuz45G1lfKbY9PCAw+jnfW+l8UBdqJNmtEbIrJ2sqLE53KfNsTiOq
         eFb1s4CKvRWi9neMTP2DtpM/surthidr9ZDo4q6P0FzphROvLdgU5lwJwzRUyWtaktDk
         7r7HdpfiQYs6jkiconZzxN8mlQu4fNndfwJ2GXyQAACkK+/RwbZIH1prDVSVveQyU50s
         6GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673188; x=1780277988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
        b=LYEKxkRBxY7sWnIIbSnA24h0x6mi7k29Dprkx5P+hmoiT56Oy2PF1drMu/AEhLN3jw
         iLF/F0xAN1VEK8qTIExVRLWOAjan81tuTZBf5RTfPgaj22Etr/MFN3oLNKRhSlDMIY8X
         Qph303Gw2dfwRfrEvl/ADx7ICLBTBLbM7VsycGhP9gd81avEUJotFEHOWmEK8cx8fgsS
         1xifPGDzU/HrxHHkgs02pznaqDqn3k6Iu9tYKbq1dXCG9Sg3wIA3PN5o6p2mju7w4DZ0
         gO/1M2LkX0GPTGgY+c6RdkUAFOPHk+YBWAXHtoHKcwQwB56tp5y1PfRmPE1awb6vrRDw
         YAbw==
X-Forwarded-Encrypted: i=1; AFNElJ/u96++suItgJFHakFoGJbbZqbRdD+5QskFlssYbKuNPb48n9QBCgqIwNNBnawi/OaZPxOzaWufSx8C4fz0EgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHhZEf8kVbCSjcCjaHAYx+LdcHX+V/BLZknG5A9geqsFiJ61Fj
	mCUdScnGgfXsocJ3FH3O3VxGyz8TNxVAGkXKHAjTyAr/vfnyVMOAhOYu+bjGaFehot8=
X-Gm-Gg: Acq92OGPpM5J9poKi/7IXd1rce6TxyxqsRxtPGjvmtFmvJx0mSjfblJwgAI2uJs0NPn
	bGoKb4onVFAK2uxXvuctGe12QklTpx2KTRhNiKgvG0lTKARMi5sibouEEge1mnxk5Whrx3Fcx/H
	OxllKvQ0UHdXjx59MglWAGCLqV9MCARo+CxgJBzvDar9ahPYBxYsAdeRVdOJEvi+YYO/KwfifvC
	EwLEelhQPVqO90dl7j9gc2eSe05G8lC94SKOkHBTo9zDsaIbFCoJBTkr0+JmYyXflHZjuXQEtrO
	b5M20s6eOtpjlViDGLpUjT2GeotZzSLBHmxSPTy7iXY48qNiNlIhQEfZ/l23qFu27ohkR8x1Qym
	XaKu7+sK/yGYRX4F6dR+5pvW6C6XTL6gGxAQdXgFG6SFzMmt3sQ+k/0csNGI6FgOPPKMjoGgd0+
	LP1Vx+9Z2RHCk7yWDnBhZ1Az4gQaTY
X-Received: by 2002:a05:6830:3707:b0:7dc:cb67:cb57 with SMTP id 46e09a7af769-7e5fee981d4mr7582287a34.16.1779673187667;
        Sun, 24 May 2026 18:39:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:34 -0500
Subject: [PATCH v2 2/9] iio: common: scmi_sensors: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-2-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=T4Bf5vbSPVSOe3vw9rQJwnz9U9F9C23dWoMfCegfy7I=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gq5kb7gqNIvRa1NfJv7HOorfQZ3sqHYlddI
 Jml3lPpMcCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoKgAKCRDCzCAB/wGP
 wNzjB/99KlgYJikZIqEx1VRYZkMM2mAJQ0if0DHyVfTAhaCsz+wJI+IQPEslFn5JAl9jhLjhmzi
 PYD3VGA6lBMGRcJSUCgM1OWVM7B7QltkL95q39cLNNpYOAVmZQx7i1YAgGsDZgyHGNZi7Ui9FbH
 7SDCW7Xyd6pJ/tgTruIR+eKKLvhkVd3GaEcUc3513TBTtXTIh5IJCAzBqKfNlH4YcvKZ7F8FYlz
 YbLeyrMG6PzwvU49sYkKLGrsU7+sg+hUQx5IcdbiTf9BDcAPq7thGaVSVGtoAdpTKnP7Q/l9ohs
 O9uFitSD/dtrvSvYhnJy7skna6h2/a4L6D9etMkFCdEGvdUM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

In fact, there was an error here as the sign should be 's' instead of
'u' which is now changed to 's' by using IIO_CHAN_SOFT_TIMESTAMP().

If we find that this breaks userspace, we will have to revert this
change, but seems unlikely since the timestamp channel is well-known to
be a signed 64-bit integer globally.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/scmi_sensors/scmi_iio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..442b40ef27cf 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -419,17 +419,6 @@ static const struct iio_chan_spec_ext_info scmi_iio_ext_info[] = {
 	{ }
 };
 
-static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
-					   int scan_index)
-{
-	iio_chan->type = IIO_TIMESTAMP;
-	iio_chan->channel = -1;
-	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
-	iio_chan->scan_type.realbits = 64;
-	iio_chan->scan_type.storagebits = 64;
-}
-
 static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 				      enum iio_chan_type type,
 				      enum iio_modifier mod, int scan_index)
@@ -629,7 +618,7 @@ scmi_alloc_iiodev(struct scmi_device *sdev,
 					 "Error in registering sensor update notifier for sensor %s\n",
 					 sensor->sensor_info->name);
 
-	scmi_iio_set_timestamp_channel(&iio_channels[i], i);
+	iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0

