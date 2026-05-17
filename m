Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB58460
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041906; cv=none; b=I8lvgOVAZonMONNdeCAKrMgl++VGrtR6Zq+ZyQDCdUjmbErb3EebF9kPBn/LU6Ab9zuoDfXXbURXss5O16YdArr9MXpaUHnqj/UA74nGKicG7Dbe+UIwdCSGmrRRPsSrdqcVRi2SRDy+TSHlATPrLOo9nfgPxc1d8hK/SYL4dEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041906; c=relaxed/simple;
	bh=MZIBkvx/lDO1bwCjTF68CpPH6+1oeby0gOD1GNgDaLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ts64QLGUXwnHg0AgkQgjnQTPTS0pHAc2XviHA2iPUWLIp4MU/A4rRuR4BAV5SstkB8+MzVuj/9qhJnvWml1Rh5ZzfYqsnGNp+Zy62c6qXf/O1FcZQec6OlbTzJJAUc+diOnY3OOpYpxw+nnAPfb53RbBMkq/DLsrsmln1sQiVuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=FAMX+oyH; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="FAMX+oyH"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67c250805ccso260761eaf.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041902; x=1779646702; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
        b=FAMX+oyHcXpOyGVFvfEqbv9cQ95nGU+Su1qUw5v8F4ieXoSsEU2BnL58pV063F/YLA
         Kbz1aDh5GSZ8GGEgAEivRhIk19Efl/CjLOJwu2Pkbo3J5V/TlsHlejBWT8/KuRFQsSmP
         gq9oZVaOENpKy8qs85shFtFXTrUMs4vc+xp/+HRBq9rEKRqVaQiKHQwRwV2gas5Q8j4u
         MNLZb7SNB0Um61Tets62svhI1LbqG7tl8NOkMfa3D/XZBvzkIg+zK4oG70R62hvt71Ns
         aihGdMX3iDrcOIqDuVHXKi0yomXwUgrDcBH7QnFkSkjtsGZ+hLeVb6JkKJKpvs1MU4qT
         Tb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041902; x=1779646702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
        b=C2cu3s6zahYilfPz/yeWm3HbLHxqJtbL025ISidbaN7/6fKnac4I4r9ZkY5zm4Po0r
         VGJjTmpv1NjDrejoJycGfU7EHVYRLMYTTVZfEutRSeh1rOMoqyYrntEgGqffgXDa2VL9
         6apH7ABUyC5hCu/LCI86kYZL+oXGgrbxGClCy3IpdWkv+B5ZJpv3c5hniRtgmWPTNAja
         H8iZtgQb7p5jagwU9qgf7QmuP1IAAnUAFQMvqLmoiYddv5I+7p7JanQQHjJibLa+zm+B
         QaHpicTZ0GD2PGZ7i+ttv+uvyKN0xfCs8hA+bcOanFe4WX3SFYDBMhyJdK+nGLruQXtP
         jpcA==
X-Forwarded-Encrypted: i=1; AFNElJ/5WnM84M2enEHVvg/UQo0FNqqlUi05n+hfyg3cYCu5smAR6nqmxrdqoL+i1bdt7mkHZ6Y7LQ61V93F/S6vS2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV9dOjo4KTQ0iOWGz2DdO30zt3aIdNSZmcQCJDg7YzgEzM0Fsm
	0zEAEi+Stm0KXpiwrd5cPQh2/FAASk62lyVtAzGW+uSBQaxDQmV0GwZn8n6y+li0ifM=
X-Gm-Gg: Acq92OFpB9kF45P2Nwl1kMey4a6ex0LLxNoDyx4YN1A9+ejZ7aBREztKOD6tCY9MMZ3
	d1LH4IBtCOecTLLczdVY4GdHie4fHmvikrpZ+P/3wkygxZ9VX2XeEe8MhKRWQv3y/vvLHhP4R3X
	t+05u6X1bKigGMwWcvybnwtHmxripfSdOnbee67dVEtYn0iYPbQvyxvsR7X+iaHBTDu1ZkmVWPt
	UaxBWklrnSEccfcXr1azWwwYAYK/wCfgGDAakgZkPN/JNHJg5Q7bQa1qUyGnRENepZ7BFars5q7
	OzSYa2aLalUyeDmLzpfc5K65xygFkrZYY38krshu/u3qFYjDAiudGBXFVSWRe5527H0SbZ+olJJ
	eGwCZ/5Dk9WPzsWHwe2S6OzwtcshM2CDfjC35VNfE9lLHt3j7klX7qwep+66cMszQzjEviePvTZ
	xVYo/TxRWmojNeWFeXcc5eWhGo5pscLJm9Bnxr7xMQFcx7i8lx
X-Received: by 2002:a05:6820:2210:b0:69b:8ff9:f582 with SMTP id 006d021491bc7-69c942ea069mr8317738eaf.14.1779041902495;
        Sun, 17 May 2026 11:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/8] iio: timestamp declaration cleanup
Date: Sun, 17 May 2026 13:17:17 -0500
Message-Id: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWXcgCdgWryJdxPhXR2waMqkIp
 Xc31uW3eG8jRRYonZuNMt6issQK2zYUHj7ewXKrJmdcZ062Z5GFi8zQ4ufE4QUf18QWGNxkBut
 7Q7VNGZN8ju9l/FvX6xOh/Ga071+ddszSeQAAAA==
X-Change-ID: 20260517-iio-timestamp-cleanup-1ee82f081a70
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MZIBkvx/lDO1bwCjTF68CpPH6+1oeby0gOD1GNgDaLg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgYvvz5e3v6t+m0Wx/sHGclkR4moFXIFRNL5j
 Yark2JG+RuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGLwAKCRDCzCAB/wGP
 wL2YCACJAC5NP41M0YnHAqSNkQZmeewP7XoDQMe6oGaErE+EeI/S4A/ytTbQDa6svMIA/r63BzZ
 uDS7S/8nbyVhwAsCra78MomRhRpjuZ+CbozTwamJHbIqHsw0MgU+tot4UZveWPlRLBNr/RMimSu
 QnGbYsInSPtIo8f0cQY458S6vcMkqGQwNoqfx4d8AZ+pX1FdO6axfFyMhOR4i05M/eh1uwCel1n
 RYmEHw/N6RX/1kq9CLVRQ1/l+m2rp+VYZ43fGdfmWrwXmgvAVNflkkSZqSs4vKkrk6UR3TxF1UR
 V8aTbiassPuhHkFYW2x/L5AvCqT5pn3gp5r/sgESNDAnSEyT
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

While looking around the code, I noticed that there are a lot of places
were we are manually filling all of the fields of an IIO timestamp.

This is error-prone (as seen in the first patch) and more verbose than
it needs to be.

I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
macro for doing a struct assignment. This does require a cast, which
makes it a bit more verbose, but we were already doing that in to
drivers, so I went with it anyway.

If we want to consider alternatives, we could make a iio helper function
or macro like the first and second patches did.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/stm32-adc.c                           | 10 ++--------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 9 files changed, 13 insertions(+), 76 deletions(-)
---
base-commit: 8678fb54958893818ddeccd05fea560a4e1fc759
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>

