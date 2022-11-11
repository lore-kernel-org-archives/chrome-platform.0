Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED51B54A
	for <chrome-platform@lists.linux.dev>; Fri, 11 Nov 2022 23:13:08 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q9so6079515pfg.5
        for <chrome-platform@lists.linux.dev>; Fri, 11 Nov 2022 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmjht/hVO1qKtZApkaycgUVmJWkPJQVFE4gCtMvHeIQ=;
        b=mi7vvLSbUqjf6eYDklwz4PxdGeRjRl5icdTCigGyh7vAmd7DxvW1+VQn3OC6on3njF
         ZXQbtjY2evJ4xsO1M58pR3sWEibkDblu8PJvoLQs1pf61kbKF25CvcjCHM6SQ2dgNIAC
         IqrM9FseUitb/bwaO2ZoBazNavf0OEswXHM/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmjht/hVO1qKtZApkaycgUVmJWkPJQVFE4gCtMvHeIQ=;
        b=gO/q5DMscwegFDWS8gXwyRMZm4HdDiCY1AxUx93kXBW/66cv4WqCu7w0aRRCSDR/6r
         yuN6KwjrX4cnlbrB/xesKdPJvC89LAJi5twcuL8zvyqLMOmtxL3BRWOeNrSg1Ay2WnmA
         cL1+v5pZKTuy8DXgaTfz9N/azOJB0Lwywwd0Igdv0dkimlVhuwBW/a0pcZfXfLpyB+Mw
         AccbdYRPU8A9Q+cdP1fLgXOIsZQmYPEOl5eG9R0LqKx7Q3ttw6XEvhoT5Os+hrUWzEAl
         /d0NcNgdFUV57VE4WEOFTh0NJuEvQhN1FlivFXnIfZaCnBZiiJImMUz02k0WJDxW/Q84
         0p/A==
X-Gm-Message-State: ANoB5pmt6D52V2ATdHM1w5WM+Yzeofg/72xaLH+2HYD7SkCJla2tGqsa
	tfWEa/G0amX3KHPkRYdNbg0UaA==
X-Google-Smtp-Source: AA0mqf5rxc3hd/kcsj61i+VfkB38xqV7oUcWId0NEijGnleSVEE6bthM12vd8724/F2aVxqYn5cvFw==
X-Received: by 2002:aa7:8813:0:b0:56b:f64b:b385 with SMTP id c19-20020aa78813000000b0056bf64bb385mr4651731pfo.68.1668208388204;
        Fri, 11 Nov 2022 15:13:08 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:dc0d:97e5:4cb6:b4d3])
        by smtp.gmail.com with UTF8SMTPSA id i188-20020a6254c5000000b0056e0ff577edsm2087362pfb.43.2022.11.11.15.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 15:13:07 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_ec_lpc: Force synchronous probe
Date: Fri, 11 Nov 2022 15:13:01 -0800
Message-Id: <20221111231302.3458191-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit bd88b965ae8c ("platform/chrome: cros_ec_lpc: Mark
PROBE_PREFER_ASYNCHRONOUS"), and then some.

It has been reported that there are issues with 'cros-ec-keyb' devices
that are children of this. As noted in the initial patch for its ACPI
support (commit ba0f32141bc5 ("Input: cros_ec_keyb - handle x86
detachable/convertible Chromebooks")), it's possible to probe an ACPI
child device before its parent is probed -- hence the need for
EPROBE_DEFER. Unfortunately, poking your parent's dev_get_drvdata()
isn't safe with asynchronous probe, as there's no locking, and the
ordering is all wrong anyway (drvdata is set before the device is
*really* ready).

Because this parent/child relationship has known issues, let's go the
other direction and force synchronous probe, until we resolve the
issues.

Possible solutions involve adding device links, so we ensure the child
doesn't probe before the parent is done; or perhaps some other larger
refactoring (auxiliary bus?). But that might take a little more effort
and review, as there are many other potential sub-devices of
cros_ec_lpc that could need patching.

Note that we don't have the same problem for non-ACPI cros-ec hosts,
like cros-ec-spi (commit 015e4b05c377 ("platform/chrome: cros_ec_spi:
Set PROBE_PREFER_ASYNCHRONOUS")), because its sub-devices aren't created
until cros_ec_register(), or they don't exist at all (e.g., FPMCU uses).

Fixes: bd88b965ae8c ("platform/chrome: cros_ec_lpc: Mark PROBE_PREFER_ASYNCHRONOUS")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/platform/chrome/cros_ec_lpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 2e4dba724ada..7fc8f82280ac 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -557,7 +557,12 @@ static struct platform_driver cros_ec_lpc_driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = cros_ec_lpc_acpi_device_ids,
 		.pm = &cros_ec_lpc_pm_ops,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		/*
+		 * ACPI child devices may probe before us, and they racily
+		 * check our drvdata pointer. Force synchronous probe until
+		 * those races are resolved.
+		 */
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe = cros_ec_lpc_probe,
 	.remove = cros_ec_lpc_remove,
-- 
2.38.1.431.g37b22c650d-goog

