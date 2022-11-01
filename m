Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598467B
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 22:22:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so263527pjl.3
        for <chrome-platform@lists.linux.dev>; Tue, 01 Nov 2022 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/atQqeE7yew2f3NLAU7m28aDdmCRbd7A5xTuP3olaM=;
        b=Z/SVfi/W/l0ZbgH7VD2JPBlUzJN4/MyupL9V4lXL/QK1qKQT1oJDwbnPQRJF1Flhw3
         RQgQVZ3rB3x2DDjEg+v2Fs7tYMStDaw4ahLmgdpZ1FuqcFmDO9Rn3/uADJGqGfEjlNC0
         uhzcpvSIuDLiZCO+KiAGnCUuLzMTSInGH8NcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/atQqeE7yew2f3NLAU7m28aDdmCRbd7A5xTuP3olaM=;
        b=MLDh4NkPsnAfEREJbAQtLNhIo7CMucHD11hsa5CY93ellAMoV3t/UtZOUYVUb67irq
         kWTCuugqqet4pmZiTsvKGWt8/h8FSGUAeCUfMK2F6FF4XCNCD6w7W0tHbKf3ni0WafPI
         RnykSm/Y4ZyJEJ3ZQSoECoojfUl0kehurdUg1o+iQU3WNKFCo95/4g41U67Yo/tY/pyf
         ycgR32pQbT5MJUoAl6neWSARP02glmhqcmckwtv/1d+OvAE1dO6izQ+alcGqaS4y5tdw
         Z6z2gfqAxHxu8TtIcPMFNxUSNVps6vxKxVnCpAACT4VtztT+3yhtAuNWZBBkPgHIqefp
         IbvQ==
X-Gm-Message-State: ACrzQf2gunl+0Z1I58FbiPR+3+gHgM9DAWgtDITTk5oe1qQ75FoZC/hG
	fXq9mIvxQMUrOG/pc6Jcq9AoHBqsi8+HcQ==
X-Google-Smtp-Source: AMsMyM6tT1E2ZOGyLhi6joXexZS2tF424ZuU80HT1E8PlX5VEfgewkfgxiOERbPawxoJGiTPW3hzAQ==
X-Received: by 2002:a17:90b:4c48:b0:214:25cd:96e3 with SMTP id np8-20020a17090b4c4800b0021425cd96e3mr1808035pjb.188.1667341376942;
        Tue, 01 Nov 2022 15:22:56 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:9c5f:7c8e:b8a2:3495])
        by smtp.gmail.com with UTF8SMTPSA id m10-20020a170902f64a00b001769cfa5cd4sm6865385plg.49.2022.11.01.15.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:22:56 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 5/5] platform/chrome: cros_ec_spi: Set PROBE_PREFER_ASYNCHRONOUS
Date: Tue,  1 Nov 2022 15:22:10 -0700
Message-Id: <20221101152132.v2.5.Ia458a69e1d592bfa4f04cde7018bbc7486f91a23@changeid>
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

This driver often takes on the order of 10ms to start, but in some cases
as much as 600ms [1]. It shouldn't have many cross-device dependencies
to race with, nor racy access to shared state with other drivers, so
this should be a relatively low risk change.

This driver was pinpointed as part of a survey of top slowest initcalls
(i.e., are built in, and probing synchronously) on a lab of ChromeOS
systems.

[1] 600ms was especially surprising to me, so I checked a little deeper.
This driver is used to interface with Embedded Controllers besides just
the traditional laptop power-state controller -- it also interfaces with
some fingerprint readers, which may start up in parallel with the
kernel, or which may not even be present on some SKUs, despite having a
node for it. Thus, our time is wasted just timing out talking to it. At
least we can do that without blocking everyone else.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 7360b3ff6e4f..21143dba8970 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -834,6 +834,7 @@ static struct spi_driver cros_ec_driver_spi = {
 		.name	= "cros-ec-spi",
 		.of_match_table = cros_ec_spi_of_match,
 		.pm	= &cros_ec_spi_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe		= cros_ec_spi_probe,
 	.remove		= cros_ec_spi_remove,
-- 
2.38.1.273.g43a17bfeac-goog

