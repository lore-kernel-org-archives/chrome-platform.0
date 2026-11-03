Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680683;
	b=qvDl37mX+OENtgB5qGqaaSsRAYpMxs1b4Fv16Ic8WP4xbZSFTaPX3H4hiXHmfATqHZEZ
	 rqs2BlASj+wfscpmOVMgXnRMgaMa0ykARlPvCCwAwerlr4yh3fH9Ij02rYOjRJy0LOn6a
	 fRbEVIepBN00493VvPlp+sqoCWRP1JFT8hRbrbQTf/Au4GXZMBB5Mg5qz6ESQ+dVjEOfq
	 zagDy2M53R0CLUa+ukeQyr5Dwpv54CBRVOoaUFqwnm6Aa5oVdXIRVh6csVAc3xjB4xsRH
	 npzup/YbhBLCAfkp4SFwBGU5q796ATDcSsaJ+iYw0NeCVRR3qthdOiF6ONTvu2tezsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
	b=Jn2AkuRCHFowTDA6mXQpRcirGrtYg8ysIJUB0hEQckMwUBEDUY4jgthz5JPLAa9rdONO
	 VqzhTEyeks+Hwj31SGrYb7yphicS+jq9rYPe9VuwVmKnO8zDFxrtTHfls6cK1yLbShYUH
	 bycbv1VWTMLLRgadP/9uE+wLw6fD4o/3K++uL8NybVV9H0XGbA4fcxXnRkNHCBm4lt6t+
	 NbE2IURO5XF3ZeuA4RZROZEQk53/8a5Xj7V3rJse/+jzugNbLlJkAjKHtE+7ZlADZI5LE
	 NpFD8RiroZ7yaUwUEX9wjmKb7RI/G4rkAUxNimtKQyKj3Ef7fDEfZXw7ycWAX9Niw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n9Uqrls2;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E829606A330
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E829606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n9Uqrls2
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1994243a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680682; x=1794285482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=n9Uqrls2TqqsCnBsgf6E00PnlD2J6jIGqHWf1CZzf0OekI9oy3OoTmfJNKRPADspC9
         z8tVRfA4YQC6PcKGy8dtKY415mOrhpFbNoHiieGtZeDoJiSaKV84brXQGD0h9KC8K7eV
         1dwgDZVf3MEF6WxWXd506exfYovRggRs6uJKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680682; x=1794285482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=NK70y7jm4O4pRgPFcKbMBAz9h5ugPPDLMY5z0kZbfPC/aR1SCjmhOMidjk2SUwLQZj
         2DL6ITw+tXMeTX2atvJoZKzvIErNoZOfTb+/xB4KuucKBVsuhfUB6Dx15P/9hCm9eVr6
         HPBgM4e8kHmHVBfAOb1Eu5i+/oIUZfhuwul/UTnZw7ElDnB9EqYJSCA1B5ZzJM2jpyXj
         QHbULZ+dgb6N4x6HgLkm90waOj5ZfI7UAB2L0vuBHi/3DIHz0qUOFIbmNOQ9gY0vlh6b
         P71XIS4UjcEisbhmxjGWTC2+swvGi21hETMSQoUiQQJRCJruU73B0M/Bs8CcfxxOII4A
         ioHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8vhqszjtlzrhiah0bmQR+IQ7zocknygiJraAzCC2nBhJ8nRtXRDvmccN9yhZs/7bUbREbZm9Cax+13hWOWlw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tew7HORRGNKehGc11oP7bOXIGlAmcheQxnkyYJZSpuIC52r5m
	JNWSqVMVEJp2Q20i8IxHe3pN0K10fL6eM3vXNOcOamEdImFPJ1/3yyrjWYc/iq6z6A==
X-Gm-Gg: AYBFou22G/JMXDkXzTH80J1Q9CZamhCz9LCn0+xoaIoXKUbgp34AOfDf9OFLy58c8Ws
	aTDOKQ67Nclf0f5rWx9QbdB149w2XzuE4AJIh7DGJu6Sot4GwBiaGLSRqJn+dt15bQO0+5PKf5E
	Lm+GZnuPXnqHOZIPdq9XoBCXDW72IOyHzUMK0nRdcZ5YYnOu+8UHNsKLF9GVAkn4lAGsHokwFDr
	fretgkTdy1cAdxgRGsbhdrNapBQQaHAs9tJr+TIDIc/syrCLCJzLd7stcXN9YgxmDxE/JfaAN2R
	AIpPo7s3KNwfuSvHODzjno62AURXZKs+SdI7Rf7DxX0w1rs8ZBLurRWpiItwtl9kms6XM3n3Q1f
	xoA/1eA5LZvehszUtmfK8NpiWzJ4GXMQ3I6xKR0B1siiHUN5V3N7WK7IyR4W8lQ/HlEhvz6L5c0
	usCaocatQd8wiqZNZ05u2mXf7XsIdBfYZsB0zoAsBcbm//r11XcFA6t3VIj3VDIA6JFEO9CYfCT
	23q4EuD4n03IgCXJLfIJEd6fPp2v66kC8rpdGv9wwZ24vv819KW6DFgCaG3rdmknRZlLvuSrcfj
	txgVno4qP7NYSR9AwpxeqSj29GbB/EzpCPNuGEiT/e7JHg//zwevhacno1tQSNzDlsEHUkMgxJg
	cv5OQAOBqJfK5
X-Received: by 2002:a17:90b:2fcd:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3ae8986606fmr10535707a91.66.1793680681667;
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:28 +0800
Message-ID: <20261103043734.2179858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.56.0.385.gac671c819a-goog

