Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429D1A279
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568089; cv=none; b=IAuhKGsQ86GSrmh6ImvTb5FCmit++lpTTphtmFGwCKoqWUEKCba6ks2uUXQiKjfPVvZ82MO8/0lxisE8kRgZY3cbzSX0hm+LIevt+CwnbRnRVwh0vt3uy1imepi/6A2yjzjf8vTckjsFk1RTr7OEUonzRO7MPOJmaTuIB1VZ6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568089; c=relaxed/simple;
	bh=MCxZ8z07WUK2BsrAfJ6Bu00FMqAk5lxvFXxpvD9oRSk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=T9uZOHkiWHWmY8dIuqkQEwA9hNGljkacfDpvUhzRgNgdknDWCMWrVONqFQgAfc8KBSiItsSlCbXtTVXU/jb/Pw7Hrg75dIzVvAUiHHlqodp476iH8PT3H38hdRlI8We1I/CXYop79NA57SGaNDmlC7SnJxAu11BcAlgQhKZK+7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J37ywo8O; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J37ywo8O"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d5e004f592so14484475ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705568088; x=1706172888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oz9mVOu+ad9eAvvgLiXYxdC8+oSkbRkyUjyWQjx33yM=;
        b=J37ywo8OPKp6CKNkFbnJa0LHhJhZVPR/CCs+DshnvF8G6IthcWNyR3PlcZbee0gNVc
         nVK/mm8DJssUqiZwJAGU4TyziiJic7u5lY7FTrBXzWP390WXhWJHF7UvDr+gfz3GljvG
         NYGZkksJcgR/rxUuhQ9nWbTHHu2N1N3N0seYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705568088; x=1706172888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oz9mVOu+ad9eAvvgLiXYxdC8+oSkbRkyUjyWQjx33yM=;
        b=nhmHzUxpUaCWa3sq+nd6qKWYLJJA/MO01pnQU8i038BYdiGm4XGTjbCtiSUaca+OzV
         IvLU6pzEkQVnTD/4QkDdCwq1Nn0FNk78s8GmGcK/NiLZ4UW2AWpM8YnzLEvehF+piGe4
         RI67m6/s7Bo+LXm2cy2+OOsaHYk5bNbg0zLaQVKIDjICgJY6+yT8pTdh1jgYnKBqm70D
         lSeHHnulK/DmaS0UELpc3IgbRx7Fo1zUDVu2KjXiDVtvuau+MeVDLhwWNgVXXRKdVRlt
         W16QK60crj+45EVbzCkeA5qazUmF614RDCrpJvgLZm778bs2YWH/rLK0vkqtEkcjdFCK
         ef+A==
X-Gm-Message-State: AOJu0YxlzkNr4CrBuWfOKLpGo4pOhKA98f1GxCKA7Yo5KRZM4NIpbyNi
	2V6DsDiCz8XlaDG6YRQm/zXjvnibfqSeHXBJEnqTo95YRiwtbRX98DJTGS5JqA==
X-Google-Smtp-Source: AGHT+IHLBlmDFJj4oPMADbmRUKL9nH9CY9T4nkMaGF60d4eQZV9wC6gpHKuBd5hsyMwfFMYc1IoExw==
X-Received: by 2002:a17:902:8606:b0:1d5:845:da16 with SMTP id f6-20020a170902860600b001d50845da16mr467559plo.126.1705568087823;
        Thu, 18 Jan 2024 00:54:47 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:6a83:9579:c455:9664])
        by smtp.gmail.com with UTF8SMTPSA id kf13-20020a17090305cd00b001d0ca40158dsm912379plb.280.2024.01.18.00.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 00:54:47 -0800 (PST)
From: Ting Shen <phoenixshen@chromium.org>
X-Google-Original-From: Ting Shen <phoenixshen@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?joewu=20=28=E5=90=B3=E4=BB=B2=E6=8C=AF=29?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: cros_ec_keyb: add support for base attached event
Date: Thu, 18 Jan 2024 16:52:43 +0800
Message-ID: <20240118085310.1139545-1-phoenixshen@google.com>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,
to allow userspace detect that a keyboard is attached to the
detachable device.

Signed-off-by: Ting Shen <phoenixshen@google.com>
---

 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 30678a34cf647..d2e0d89d4ffdf 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= SW_TABLET_MODE,
 		.bit		= EC_MKBP_TABLET_MODE,
 	},
+	{
+		.ev_type	= EV_SW,
+		.code		= SW_DOCK,
+		.bit		= EC_MKBP_BASE_ATTACHED,
+	},
 };
 
 /*
-- 
2.43.0.381.gb435a96ce8-goog

