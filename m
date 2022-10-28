Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF48B1FDF
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 21:15:01 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 130so5802916pfu.8
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCN7I+EqjmDeqN4ZcXaijeJfrEMHUPCGCQAvUPZS81M=;
        b=MRFIWNNIgKHBvh4unQXvkUv/KnK3shaSHRyNpOREhOzFu8iGl+9o5tQiSQV4eDXNOM
         uaH8au+EGSgrOD9dvOLB1t/fra8RMeTVP8KcZgWLqIY6XBnXZky8nl+td/g4Yi3osJ4v
         SxOLmmOQIFljRPJ9HF6N0fH5sqhc4YdW8B48s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCN7I+EqjmDeqN4ZcXaijeJfrEMHUPCGCQAvUPZS81M=;
        b=og2tqgqAsfHdDJ4DY00sKzezQtRHAqSdt4z2LiyagbWXmNQmEVC5DTGunDCii7WPXB
         VHUw6GjuwihZcD8gS0uduHIDiSEGSb48QyzO6iqBYEh1GGrQ+BvN7N/8axj3u6aqr8lE
         OrVSsa5x6jUfHEmvrhKj7hSc1gV+b34WPaBrc1gdKsrYoef8QzHaqsIg5E5sFbFcr1oK
         zR0YJHniuIx7TsmCSF3mb22krYhN4zNolr6JX8q9/E+hpK4vo1yupjEE2KI7+tN+ZZuc
         KhEr2PWfHb4GtskPcL8qBbflKR2QtAr5AWR3TE7I4hT0AawnE30Gzzx3mXQjhrQZXicu
         Yk8w==
X-Gm-Message-State: ACrzQf2v+72MtAYnFzUbYPK/ZKQuWYZVCjQxNZrcnWKqdDlEKZBgIf7t
	0/Mmw2CpKMB6gbTSZ9MOp/Nn/g==
X-Google-Smtp-Source: AMsMyM7MS/OMYYDUX0lkL1LaQGX3qWIrIMDAcIQKUccoDumeeijHos49DBizdRWuNJAhXdV0+TDFsA==
X-Received: by 2002:aa7:838a:0:b0:536:101a:9ccf with SMTP id u10-20020aa7838a000000b00536101a9ccfmr1065977pfm.18.1666991701429;
        Fri, 28 Oct 2022 14:15:01 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with UTF8SMTPSA id b15-20020a170902650f00b00186c54188b4sm3442174plk.240.2022.10.28.14.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:15:01 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 5/5] platform/chrome: cros_ec_spi: Set PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 14:14:49 -0700
Message-Id: <20221028141411.5.Ia458a69e1d592bfa4f04cde7018bbc7486f91a23@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
References: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
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

