Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E1428470
	for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893869; cv=none; b=CYutgXv3OEeTQZrb0XsfiTSC0xcq++X9fvdA2VuJ5R5yDdCLa6SAjq2jiSO2F4EhKoF5GPI66U79kzm7TEA4EWFf3oOigTfG+Y2/PABHDq/HDng0Abp5Sj8v6+O2jbdl9jJUZtaBHaepxUQkODSheF+rhekDyXAEyfyfCnRTvt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893869; c=relaxed/simple;
	bh=vQCA0xy/RK13te7H73tl2LO/O48/qivp+4DR1mKFKdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hagEKEcUyf7ins7sgk3ibumCnXb4R6KAfMiiiVko+7hzOa8u/ZvllIDObkx/RkSOnwXrMdj6BYBWdb3++SbUIXTrGYeuMM30Z5/D/y5Ckel2FzNCpzmVoyOdJMGXKWXf3anT/eDTIs3Ek+54QlBmdCAz3Z3ntH+9LdNULpoVdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BpeMt0l6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BpeMt0l6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so124602235e9.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893864; x=1780498664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdZix5ZL8DWP4XXKmNmZnm8sud2uFubqPqpDqHG3z9U=;
        b=BpeMt0l6CbDhhmYsgCMgBvyemNFQ1KFFn6rn2Zxk6rernCr4OOt5VhE88DrJHJc/xI
         NbcrrtsMcvig/oKtdy9+7SxyZK2acxrRHWvWhhiZPGWrtM/ES39gfYqjEeDmFXL69Btu
         2tWKAudG2rvLLdvPWIc183fB0wwPRB/sF4RE6w44IBNxQ4U8hc3lJYyTI9PU3b/kqtb7
         vTYN4/fQo99bC6YzfeSs0xyziNd0aeaIPLatxVUi+iQftsvWlUasEb1KnF0jts+IwQIR
         MmQ9jc8h9wfOgqvHBMqZ1ayQ4LOeZ9+xWm1f9aJ/JD+JiScH87Kdh64VlxqiGcFQb+uM
         OLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893864; x=1780498664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdZix5ZL8DWP4XXKmNmZnm8sud2uFubqPqpDqHG3z9U=;
        b=dbUZWLJ62uV+JAxhAZblfq0mhCyI2HM2gQBnZYRoGvJ5KdiG2+qORcsfKMn93ZSup2
         6tcsKE7k9XEMt7Kn+k27uE6QhbUz37SJdY0r3MZjFvGROWpy39b1iqf2ArgogJEtiIZz
         fWJbExR0ad2XTuJFQss3B22AWHffMW9SWaA0FaolilPeDlu9zDE01BWyTqdrrGohhXoe
         Gk3nCztIF3pOM24D/d4YZ9Fvdeo33FMSfTO/WHMYYlNdYAGLAmm1gkB1jaZp0laSOP/7
         Yqe7exsnQiQQpOiGEl3Ul7bGd+uOY8s0AZG0oKLVjGG2XX+JosWhYUGnQv1V5qGCLImV
         AK/g==
X-Forwarded-Encrypted: i=1; AFNElJ94GRguaEEpHGWXWJaAo7OxxK7GZbjQ0Lk9xEqTxV93zm7g9iKnGLTHZF3gcHDaSY8nlf734mlX4mIrS29qJcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVmqne13S9ilqzfAG/WShR2/i3hVP6TMV30tBScfBG8ubhFfyM
	r+CTOjG9rBeLxNfWoiHZ6T0d6b/TVT2DZQlvRvR9WHRiC3FQZn8FJ6BmF15Huksgaz4=
X-Gm-Gg: Acq92OEFSz1+nXiaFIef2Z8hJ/c9TXvTgFbgR63yXoAQRAuvLFvVx7eucqCrXApzX/m
	BnK/hyVVP5mTdtXkuwkg8xwrMgnEf498/v57L2c6C44UaBQSaAOPwyv/8WpULmr5IraGTE9eOYL
	H9kdxkyiGr0GbOUB51lGvuZX50A9Uh/Sqs9qJzv/kSDtgIe5hA0Us2aAePNpyGO0xIkg/JqPnct
	wROQ319tF/WrlQV5ul6iMZtJ3Y4bSLHTPoR3ylzKttNOPmaymok2cy5DP+sIyxTGSZjtbNvtrXD
	ixIjjywRt3SGO8ehjpUW/4bjR5csOiK9y3eO74hL1RVDkrPbDBqgtJKtaNgcDs9qyc77iKtIpXx
	yLX70/kcNJhh9+BAtEmW46OX5BtfwRj5MkmZmg36ktvCir7WOPkjsCHSvaPCYml9oA71sZ/ely2
	u+Ojft1hDvUQRc5zl4tKAc6PXXGRmi28F2d4BvsWLuLOhv6V3nNl9V7r/ogZeiULdBGS3mTYa1t
	tN8XLkNvUlgXpwteLTu2E+GMQ==
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr280122195e9.24.1779893864097;
        Wed, 27 May 2026 07:57:44 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb54959bsm7244394f8f.1.2026.05.27.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] gpio: cros-ec: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 16:57:27 +0200
Message-ID:  <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=vQCA0xy/RK13te7H73tl2LO/O48/qivp+4DR1mKFKdk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZZqEXMfe/Mgb6+8P0bViKN93EGfrfb1jkzs 430bK8rx4CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGWQAKCRCPgPtYfRL+ TuQvB/0dSJbIkmZfCV1oCAhH3VvwY4v9jGHUMC4B/M/0raObaWNw8zxDF+MDQXgaevUXHb2j4tD 5vN/gmDTvZcqcf9cxEQAJP/SPuEaDWM0llUBOBjx42Ui4agjCmTlgm1X7JR/j6V2UlXiK7ZNlql HsL8zRvojrleJ2FVuh5ykDusdrr/jGFigymIHfDKm6mHfD3NrXXxTS5tw6amS/QgoALIfb9DFP7 IYy/puDYQvtnoA2C2cenxJWyvjllsZjGVW1jSnSnPtr7nk73lCq0SERURirRL+ZmjGAwWOEvjqU iu0IbbJ/SqHe96yQz4gtBlgpIeoie1Rtz3e4/OOitjO9LXcE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing and use named initializers for
.name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-cros-ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
index 435483826c6e..9deda8a9d11a 100644
--- a/drivers/gpio/gpio-cros-ec.c
+++ b/drivers/gpio/gpio-cros-ec.c
@@ -196,8 +196,8 @@ static int cros_ec_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_gpio_id[] = {
-	{ "cros-ec-gpio", 0 },
-	{}
+	{ .name = "cros-ec-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
 
-- 
2.47.3

