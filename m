Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB093CD8A3
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041918; cv=none; b=KSu7lvr2bRp9ulJdILfmf6BM4Elp5hMD3xbujwZWrFDRBAZ12y6gfF+1lEPmCGNBaN+mmGtbKwlYfUb0YTNjO9lwlTgM0oyWwsC48iOq+6qop6hP3NAEX1fGina5P8siXTXOn4iMPAdqXuKHsBUkyL8NTGygG6MkQF5X+kbh4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041918; c=relaxed/simple;
	bh=G7Szwiws6C+kXgCk6xisivu6OlVDwdV0dSr7Bj27sJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmARr9YzOBC5Gi4VuW4ycVrH5jOzQ2SOfDT5oU10L+s/OxSSmZIGRAj6TTOhlKjcqcnPE2CZDdgeUi0vw9UwVUsb3p4rjIBPjuU0u8GRiGoTnyZB1CXDKjgN3q450Tg72ihROnTunh3SqD/r4e6Fpb7nPzAWFVUx0TqYyIxbzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=QNEXIlt3; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="QNEXIlt3"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69d37777215so5276eaf.2
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041913; x=1779646713; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
        b=QNEXIlt3XdCV9fGka49F9KQ3aji+szklgtCKhmfavwcYAVaieBH4xfwSunWIGRRIXj
         xzyeoMCRRLtlEgwbo1Eow3zfzko1+1deGWwZ7hpvol1a4ENETvTBHBhYQHBRV/RaEOD3
         YoPClSo1+onkwsVMnEiW8gMIfg+FtGsT3cTTXVo/20jw4AQDVJ7EHxto/WLCo3Cc8x+P
         WttAHYlHOTUbmXoeQhnNTxnxi250NWSBv3ilOllzkURpjaSkdCjkRy+u1atqwyob0veE
         /eNgOyN/HFnbgD5K5PeGfhPcWfBaI3Mdb1qS4RtEU9aYaeP+XvCFs/Cy+SJICJ3ngvkB
         O0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041913; x=1779646713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
        b=tLtZdRmaDPHLcKUf+BAo1IVO4ngvXgRFKintRGu2R4eFFuGjd/QH5P0Yfvic1s1hD8
         8Mq8zNooaHBXNljKqaQa2WC0Xt3ObDvye1N9uTkRCTGrYGoR2uCpThTypHrrK+nKaFUg
         1+figa5v/qA1J5vm76ET5eABF6m7XeLIRPZYgIKkrF5qpfddNEHQqHpTswtMK1dd8vL3
         16NjGW9jPVb8LbIlyO+idtqpHCq37AX56qywa2lxlynaW1MOnU9195BBv5y1j2nohZzo
         7/9Nkc8dRpE0yQEpeRO3agqebfbldFELZfnFWiOmkLrYJphfF1Swjezld5gxqU+FAqZ2
         rJGw==
X-Forwarded-Encrypted: i=1; AFNElJ804Lb0T2tBz6j0ZE9iHg/hpMayJml/i/38Zt13k7tHO4t/YNWTFvpa5KAo8quz9pbDMUzfdT2jL47wLb/dnW4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8t0+8kUJdWyj7k0ttmYwyDV2xo9R69u8PelSTEsS3exwk1w8u
	HrYdZtFhey6mkWjA/nwVu8LLwwgjpu8n5sqPU8Wc3ozxBnLpz0LJRFctWmOuMLmtJG0=
X-Gm-Gg: Acq92OFazjiHg3y18D2+iA5OZc4+DRdy2mIZLLP7hdAAZCGJj/Gj6ucvEfI1apYAtqH
	BkXTnVdxxvFJhrOP6p5WHcv8eqhZR/fyPuCiA3I5bg97RGvblD1D6F8yrLKjsOdBQ25kG1v1t67
	/Uik6SVhquchXOeiS29B1nuppOWWOIj5mq8RkbAALqGYQ9RZxgfuuzxOIy6IiDrIoSkKziwvaMV
	119OB3Z/oIUQY1yHwly8uUv50TxvnaoD8ROERP35In7BUYsGkBRq5uvOdA2Bv3P1yOj5xuiDLSy
	w8TciwVkSombkUyC36nHMD1OqH3Xta8yBgmz5FziYPh7vMG9/HWID+kW6zVGJZh55gAnsePKEcY
	4NpKU9HwFc8qu9qa2y/FHbAOsDp0ZAO0NL6yDKqGW4pygGI/v2d82Hv45w34yVqwvlNgHhJtHUD
	I4HrCkiwYLIXhZC6gCnEHX2KIaIB4=
X-Received: by 2002:a05:6820:16a6:b0:69b:196a:de62 with SMTP id 006d021491bc7-69c94377590mr7647901eaf.27.1779041913148;
        Sun, 17 May 2026 11:18:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:22 -0500
Subject: [PATCH 5/8] iio: adc: stm32-adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-5-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=G7Szwiws6C+kXgCk6xisivu6OlVDwdV0dSr7Bj27sJk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZRVFRaQSBdSkHoxJ6yR/B8XlsRDlUP3cMKz
 CVIMrFdEM+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGUQAKCRDCzCAB/wGP
 wOtRB/95xIxW8VGaKMif9Izi7JG162j0YqsXHso5T7C3wBxKCbha4uf4X+4lM2uAPDCUAIYTa1e
 hRZUTSXFWZfvnvqS+25laf5z31Wa+ybT61fYxb87EXbWlhwPPlfS/BvXjYKeWljsJNw+/VvC5cE
 DY5MR93FTBEW0Oy51IA+PzInlkVDYO5NvhgDF4UBBXxQw9UdzVO1dcHe5f2Uv2NRgPokVx8OX3G
 +70ao6CG97J+tL6sk0SbhbajYAYyM3KBEQ0JsuymiWfyKo5HvxpGtSjjB6wk9WjOYQ+sKnsnxv4
 YmYMoLuBNLjDgWWPLV1doL8ycCy/rp+0lVvXbLzXCC9R0pJh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..bf68f28e7c3a 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,14 +2443,8 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
+		channels[scan_index] =
+			(struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 
 		scan_index++;
 	}

-- 
2.43.0

