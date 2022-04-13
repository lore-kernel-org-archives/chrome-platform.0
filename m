Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523223BD
	for <chrome-platform@lists.linux.dev>; Wed, 13 Apr 2022 03:33:38 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c23so888639plo.0
        for <chrome-platform@lists.linux.dev>; Tue, 12 Apr 2022 20:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5+17MwOfKkjlV7qFQ2T4jzjQQOl3tsJ8bcwnmeF1zs=;
        b=gbH9pYSjrXenr+hUMeYXKSMyWCpkwKnnto8bFtn/g1IZ1uI7kom4DXNkPWQSgFGQW5
         by9E/tmsfTyEpyLgDkMsxkw6GAQJztqGH2edbwAAlvi2eU3wbhyZNwd+kfbQS3o9X146
         tKxmkPIQ349/AiN2qc2+epD7kPXKjd8rsErwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5+17MwOfKkjlV7qFQ2T4jzjQQOl3tsJ8bcwnmeF1zs=;
        b=PU3ffVyDgoN9OXOesl6SRpBI9lXIThdeh5IWFf5CdpEJgFA+cLl27fRQd+DVXgz9QU
         CP6TJ2DiHWyp52MaLIuO8Ym7d4Rk/Os9pofRpcLDLi0ByNMDgUVNVR2MhSFwtdRfV7fY
         7wZBo8UC4Uhw6ZPSMGYY057ijH88oByn8OijRQkhv3snP1ehSWGeTdrygcxb69U0EzlU
         +eIAkDEtN6KNXCcFsjfDXASuOFOvpeVsAe2O6xarXNATQo/u4kI7ZJFllwXS3imfKBRX
         /1Ns1n4wTC0q5prGUJqzVM918fI+dHnwT9/4E/T0inRDEgk83NLQqzldi9dvrm7PqCJH
         kxow==
X-Gm-Message-State: AOAM5305jNxxoAoi50OEsVpPqPWP7TNFdrkmjbx3RDlHJuTfnkX/KD3M
	vTMVMehKnbzgn4E6BJi2qT/nng==
X-Google-Smtp-Source: ABdhPJw9jZo+lRdE1iLDIO0NPPq39p5vIfxagy7X9ANc7aXbHjJGphu1yS8zKqRb4HpQTnlksnxo4Q==
X-Received: by 2002:a17:90a:8581:b0:1b2:7541:af6c with SMTP id m1-20020a17090a858100b001b27541af6cmr8534884pjn.48.1649820818315;
        Tue, 12 Apr 2022 20:33:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:87b3:e0ea:c924:6d1f])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00230a00b004faa0f67c3esm39788276pfh.23.2022.04.12.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 20:33:38 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH 1/2] Input: cros-ec-keyb: Only register keyboard if rows/columns exist
Date: Tue, 12 Apr 2022 20:33:33 -0700
Message-Id: <20220413033334.1514008-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220413033334.1514008-1-swboyd@chromium.org>
References: <20220413033334.1514008-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device is a detachable, we may still probe this device because
there are some button switches, e.g. volume buttons and power buttons,
registered by this driver. Let's allow the device node to be missing row
and column device properties to indicate that the keyboard matrix
shouldn't be registered. This removes an input device on Trogdor devices
such as Wormdingler that don't have a matrix keyboard, but still have
power and volume buttons. That helps userspace understand there isn't
a keyboard present when the detachable keyboard is disconnected.

Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I tried to use mkbp info to query the number of rows and columns, but my
EC firmware doesn't have commit 8505881ed0b9 ("mkbp: Separate MKBP_INFO
host command from the keyboard driver") so it always returns 8 and 13
for the rows and columns. Sigh. With updated firmware we could query it,
or we could rely on DT like we do already.

Originally I was setting the properties to 0, but
matrix_keypad_parse_properties() spits out an error message in that case
and so it seems better to delete the properties and check for their
existence instead. Another alternative would be to change the compatible
to be "google,cros-ec-keyb-switches" or something that indicates there
are only switches and no matrix keyboard.

 drivers/input/keyboard/cros_ec_keyb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 6534dfca60b4..ac9a953bff02 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -537,6 +537,15 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	u32 key_pos;
 	unsigned int row, col, scancode, n_physmap;
 
+	/*
+	 * No rows and columns? There isn't a matrix but maybe there are
+	 * switches to register in cros_ec_keyb_register_bs() because this is a
+	 * detachable device.
+	 */
+	if (!device_property_read_bool(dev, "keypad,num-rows") &&
+	    !device_property_read_bool(dev, "keypad,num-cols"))
+		return 0;
+
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
 		return err;
-- 
https://chromeos.dev

