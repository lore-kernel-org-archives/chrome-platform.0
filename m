Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7711B6D02
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761178; cv=none; b=fqnNVyjWX2IvuP6UbzBY6N1fmbkqjWPqBpbirk7ovpU8GqobF4JzSzQkIiFCltbpZsKNkvWewVY/AQ6FZONhArp+PpyH8hkVHYGLdE1AznIohk8wgEPtukXGf0VWK2WBKPT78jPiidtcCEkPQ0/EWLIBXx+QB3dXbsveYN0lzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761178; c=relaxed/simple;
	bh=gxT5UJtPsva0rf/TD2YMcs8UCCD2ZDF5U8pMvCjVzqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpYNcCvw2NM3Ci1ADnU+zHAd1ocu2rVHaGKSzfZLkNszAJsCN+Fa6kh0G6JXhBit92INLjHtGXyJvA8iPN9e85cg6PyNRRX+k0t/cVBdYKNT9Z2bKqNETBR18YYNIDaqyBZcXenySToGmZY3eGznT4L+1nqjZuR6USHjmnl35mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ud0cRcbD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ud0cRcbD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so407337f8f.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761174; x=1730365974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ExSlIGvQ1qKjNeppy5CslHA0+Ug61+8Wg56jV+Rbdo=;
        b=ud0cRcbDNrh5PUgD1x+U2GAeBoUdU52BSKEJJ73YrTrk7JljwOKT2kQkvU9q0Fhc7P
         5vy+iiVxDa7paP8xhTyrs7oP1tKkiBf+vErFzoFe6yWmK9vgdOIxfHKtPrzDvYL57lqg
         2X+NyDFequckGhM3AZBiCj2eZmD296I6PPNhbhSFJWkuOhMiSm49pCyoHkqqjuX5kIJo
         gvuilzjW7ljnvujUorniLc6Pm12tMUT7sz2htVO4sHigcY1xThA07E6Adw0ND9QJo68k
         oD/Vl5TkqsItgW/3c11BU0/v9DsxZ5sCvrGKpKGFoGZWqFLd4QBV3BMy9Ql9BKvmyuPA
         SjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761174; x=1730365974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ExSlIGvQ1qKjNeppy5CslHA0+Ug61+8Wg56jV+Rbdo=;
        b=RNfUdVX4AcQeP4lGzMiqC58ZxK/UYkr7oHH+sauWPYotoC4lq2h0k45WS/frjDgOOL
         nRAEAfwsymk/EvBlDHMp5xcfRK9yuIHPoLcsQRd73oTyPt36mz9RF/7H/wCIDGCnn1zA
         c5rVRLTIcJOEjyLJaUd3n3ro4PK9eqILT7buz6/pP5nVVdT2HPGhDpVB/Vsq2bDHcqdp
         AKJ2PCoeehfmrDiSv9RYywRPOj0nTxZPivaVoONnm6SBFzehS41NpjucJFCjqUrn6GK+
         gH6Eg4DmvBFoEauzHQ8r8gOaXXkSDybwDyS6QIvmzl8Kq0GIaRKlgA+CRawi+KPhxhdS
         mBVw==
X-Forwarded-Encrypted: i=1; AJvYcCVf4UOsQ1hWdCS7Q5HBnJKE4IO3PNBLGxVFV0msKYjjq3puLJIJcrzdH43s4/YbiAw55ZVOnplt1wP2vkBySS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxXIWgJoJAwgaelBLb7sqn6MmD32thmgVRjsvo6Cc1a3lGyq1N
	FoDRpNnzAE+z4ZfOZ2Utc7gfDINkNJ9Uj5Kwr+/fJCRiOT5s/McWXttcOCEsnEI=
X-Google-Smtp-Source: AGHT+IHssIn5+2M6/mPZQxU0hUVx3UQF3gcvmL8dKPbUHqhz4gdaCpTX+p1XSijdvMnFvDxT9HuOTQ==
X-Received: by 2002:a5d:66c7:0:b0:37d:50f8:a7f4 with SMTP id ffacd0b85a97d-380458f3f6bmr784047f8f.52.1729761173970;
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:28 +0200
Subject: [PATCH 6/7] iio: light: stk3310: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-6-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/stk3310.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index ed20b67145463d253a0dff28a4c1c3e02e710319..c6f950af5afa0f77a617bd2baf0a08eef5ec26f0 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -330,9 +330,6 @@ static int stk3310_write_event_config(struct iio_dev *indio_dev,
 	struct stk3310_data *data = iio_priv(indio_dev);
 	struct i2c_client *client = data->client;
 
-	if (state < 0 || state > 7)
-		return -EINVAL;
-
 	/* Set INT_PS value */
 	mutex_lock(&data->lock);
 	ret = regmap_field_write(data->reg_int_ps, state);

-- 
2.47.0

