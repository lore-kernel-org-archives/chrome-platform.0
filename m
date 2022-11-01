Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457D7B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 22:22:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d24so14876135pls.4
        for <chrome-platform@lists.linux.dev>; Tue, 01 Nov 2022 15:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhDBAUhO5scPlfZQJJkosTaLVirDeVVGs54DNXhKQpg=;
        b=U4JBkHwZ9YjBgtJFqGJIhTwVRG1U3DJ4XqLA9TnHH1CZp6GdyHKLYgQ+o5Y1u2QBPj
         fTJmP6U1Z+wznRqQT5hkSlw+EphKFYnQYZIvuC0uUkiVK5TUEWxPnwpd4m/RpbXlL0HC
         4qwqxdROBnxcvdQzFKuAwLc0tcgH8e4nkt54U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhDBAUhO5scPlfZQJJkosTaLVirDeVVGs54DNXhKQpg=;
        b=AYO/r822fEZofw5+fgyQeooS73PuN1OiVY21SZGwrATBGKtO2rLXnYbbe/ItM1nm5q
         JvT61x9D4772I4alHVW9V2rIaeS0xWRsUYgQUZr/HLEt7z9h/IqqmKZcb5P4dAGwXXwG
         rLYOQ8qxPk1Q5cey/4EW1QnQnLaybSds0NZ8FWaMoLw5HiT8OZRnItauKk4aNpQpoaHe
         4JaOlhpO52KJ2gcDrFwlHMgihussyPc2BXVkZP152ecZ3evjgTuDRgfgQWw6CsAfdVs+
         j/rpUQfFb4zQV/BopM9orC1YhCvTW+bV2kXyeS7A/FTNYQvMjBc7WurbR0JcIKdQV6DR
         UXxQ==
X-Gm-Message-State: ACrzQf3omRnu6eOBEQ+oQzEs2IjYeGBWw2nozLIDu6OoWTQMzMif6tEx
	x6SmOpebL+GYVpDsxMTAGND+Qq7QiMpdTw==
X-Google-Smtp-Source: AMsMyM4WLgDDjTjLX67kShDt6zODkWQSyOwZps+yLROfGu6JclUPAsRo+ohLF+F9J+909Trqzs+Ybw==
X-Received: by 2002:a17:90b:1950:b0:212:de19:b3ce with SMTP id nk16-20020a17090b195000b00212de19b3cemr21874558pjb.16.1667341371422;
        Tue, 01 Nov 2022 15:22:51 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9c5f:7c8e:b8a2:3495])
        by smtp.gmail.com with UTF8SMTPSA id cp15-20020a170902e78f00b0017f5ba1fffasm6797659plb.297.2022.11.01.15.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:22:51 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/5] platform/chrome: cros_ec_lpc: Mark PROBE_PREFER_ASYNCHRONOUS
Date: Tue,  1 Nov 2022 15:22:07 -0700
Message-Id: <20221101152132.v2.2.Ib1036816e77aba71ebc16b71f7615c55d054689c@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
References: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This takes on the order of 60ms to probe on some systems, so let it
probe asynchronously. It shouldn't have any dependencies that aren't
handled cleanly.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_lpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 48302183d62e..2e4dba724ada 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -557,6 +557,7 @@ static struct platform_driver cros_ec_lpc_driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = cros_ec_lpc_acpi_device_ids,
 		.pm = &cros_ec_lpc_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_lpc_probe,
 	.remove = cros_ec_lpc_remove,
-- 
2.38.1.273.g43a17bfeac-goog

