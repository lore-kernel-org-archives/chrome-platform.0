Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE345C6E3
	for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587089; cv=none; b=i6eDt8XZIeLgn/MwiAhDGFz3UX9n5x3YN8tDiOT8QJo7vDRNdNaJu6j9kksxHdbXWNU0gZTd0A6HQ6IpbTZg+I9HKGb+YTtDvYx99+YimA6jgaLY+etfgPmloaAP8B4Hg3quwjty85S2YeJJWZfxb5Kly14QMqEaJTbtrSnFL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587089; c=relaxed/simple;
	bh=Me5WofGk/SZRmiK89R50NVJUk7M/6dcktu4uRTpjcUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hm7nocgy/qnegsv0rNizdaDal9QtdqjaXwaCZUeePHCv8jOVb9Gku1pkGZbWqV1UGDEgdYBqmHqKH5mSRpLmY8+nWrtHaf4Xbc49eVmxifuZUOP9n3ozaWBqlrK+sGLCIRDC1rHa2KULNOOt3sTI3i2bMsgcW8ww3mTxss5diJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llTrxjpI; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llTrxjpI"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3477068a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787587083; x=1788191883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BY3D6q63ODXVixus4xdfU0vp7F5Ma7CkAlm3CVp5Okg=;
        b=llTrxjpILFqeVWv7ilLGwhrPq2qPfuZpW/S4tZ4Ux0I/8StugUCuKfyPW74Irg4lQC
         9ntYdsEbtgQbl/pj5PBNcG5mGQ/eY9INGK/QicrzE9HoDooMprbRTootO+/RslXRvQw7
         FELs+zAXqprByn3jxPpUy9FDOnxYwnXgDCfXQFGs970+6FkKAEuqhuOtt9nQbgg+5fWL
         5l9UHFuv6TavV7Rb1qTTPJ6lyLOrVAtY7noJTlcfEMzmwiq3r3i1N3l7EY4iM8UjJWgq
         FCaOH1x6LFbvmtdeMDzltupGLqVOlZQpO23f9CD4DYiDJctjOdQJ3JlZYVCoFXX6mQfD
         4VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787587083; x=1788191883;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BY3D6q63ODXVixus4xdfU0vp7F5Ma7CkAlm3CVp5Okg=;
        b=Vvg9UrJ0B7nfEe1/PPWcQrYz4bAzxWOhs4JOAWgsTM0nKakY8A6Rua16c6KCrqtJgZ
         62JGML5XRCpW0xtADsIA+x9J28k0420T+yC/5keTV6dXM+SyJp2C1VS0UOS4gEJweR8v
         f9wGBXjz6PFmeDMEnkqW2ZDELs2rPUhdu3j4Tq0NQsBZjpdh/NLltf7pECTMCRmDZg1w
         2AuHMZvwJ39C0Su7fHB6Fiug0d81sWpiraJiwATB3AH6U1RxRMD99TMsXa+pEA/VbgzR
         h6poAikTLvLKAo8M9p+o/CsmMSB5oTWsI4AHcYwdaEfZLFgrvjXW+pvCcDvXpRVpUJ3o
         CbEw==
X-Forwarded-Encrypted: i=1; AHgh+Rqy61cxep1NqQ2UdFdni2hfTgKzoD8TIRbOiJS6ISBqQWyhuODmXKRdvjw67iRs8MWk0SE0jaUa2qbPs+S/w/k=@lists.linux.dev
X-Gm-Message-State: AFuF++nJXleIaumhnD/HTGRSbPNGJTRjFejqRrXQwa85WWwbu/67v9D4
	fcIt+L2b93syFtD4jtAB481xnhOcm4dPlY+94ou8nBg0UWzHNaWMSilK
X-Gm-Gg: AR+sD11eAUIe0ZcMe3XOUgjM5P2c0jf/puan3dErQr+Y6osru5jalTJZM+d4JD6or81
	ksxr+InvWmnCZhkpPdLvMdLVYH74LpSBzAxTe2mSKhTaJkJJ2OImFRr0eFaHWiMoNp4vfKI/NYJ
	qZpD3kyLS0Qo7yJiTsfktvEoeU1UTetboGaX7zKRzL8Q9QC9gY/ozIgwcpW+IAsDbdGF86ch5FO
	DZUf5xuWGpzRXbHRgEDYJacrA5znXA+Pl3YJd3A61g62RUlZ+3Jik07SiBzzu6ihgg0cjqPzMJY
	pvqlaAlEJOZGg4U+VaGXk/AyA4iYzmqlYrw257Qq+1Yjau2Q7XDLcbaVMbwVhcJf24A6V0qQ13x
	v75B06tZRvN56SseGADmaDwXpu5lnivZWyni28Wub/RmvbndOfdVAusa73AQqq5gY+OKpRf+Oop
	nVCLSt4JxqKLJidTNoWsRG002gleYaG4hfcGPlZTpL2tr1qtFDg1F8/ootvicd1g==
X-Received: by 2002:a05:6a20:1605:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cd3003dc4fmr58213911637.13.1787587082858;
        Mon, 24 Aug 2026 08:58:02 -0700 (PDT)
Received: from sh170r6 ([47.221.33.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm29943267eec.7.2026.08.24.08.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:58:02 -0700 (PDT)
From: Matt DeVillier <matt.devillier@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Matt DeVillier <matt.devillier@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC SUBDRIVERS),
	linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] power: supply: cros_charge-control: adopt EC charge state on probe
Date: Mon, 24 Aug 2026 10:57:18 -0500
Message-ID: <20260824155736.1186510-1-matt.devillier@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver previously always forced AUTO with no charge limits at
probe, which discarded sustainer thresholds and modes set by firmware
or firmware setup before the kernel loaded.

For command versions that support GET (v2+), read the EC state into
the driver cache instead. Valid sustainer limits are adopted as AUTO
with those thresholds: while the sustainer is active the EC may report
IDLE or DISCHARGE as a transient hold/discharge step, which must not
be exposed as inhibit-charge or force-discharge. Sustainer off
(-1/-1) still maps to Linux "no limit" (0/100); other invalid limit
pairs are remapped the same way with a warning.

If GET fails, fall back to the previous defaults and SET them on the
EC. Command version 1 still cannot report state and keeps forcing a
well-known configuration.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 drivers/power/supply/cros_charge-control.c | 159 ++++++++++++++++++---
 1 file changed, 142 insertions(+), 17 deletions(-)

diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index e0f168624807..fd620317cfba 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -21,12 +21,22 @@
 
 /*
  * Semantics of data *returned* from the EC API and Linux sysfs differ
- * slightly, also the v1 API can not return any data.
- * To match the expected sysfs API, data is never read back from the EC but
- * cached in the driver.
+ * slightly:
+ *  - EC sustainer off is lower=upper=-1
+ *  - Linux "no limit" is start=0, end=100
+ * Also the v1 API can not return any data.
  *
- * Changes to the EC bypassing the driver will not be reflected in sysfs.
- * Any change to "charge_behaviour" will synchronize the EC with the driver state.
+ * While the sustainer is active the EC may report IDLE or DISCHARGE as the
+ * current charge-control mode; that is an internal hold/discharge step, not a
+ * Linux inhibit-charge / force-discharge request. Valid sustainer limits are
+ * therefore adopted as AUTO with the reported thresholds.
+ *
+ * Sysfs reads come from a driver-side cache. On probe, command versions that
+ * support GET (v2+) are initialized from the EC so firmware or firmware-setup
+ * programmed limits and modes are preserved (unlike earlier behaviour that
+ * always forced AUTO with no limits). v1 still forces a well-known EC state.
+ * Subsequent sysfs writes keep the cache and EC in sync; changes that bypass
+ * the driver are not reflected until the next probe.
  */
 
 struct cros_chctl_priv {
@@ -44,18 +54,20 @@ struct cros_chctl_priv {
 };
 
 static int cros_chctl_send_charge_control_cmd(struct cros_ec_device *cros_ec,
-					      u8 cmd_version, struct ec_params_charge_control *req)
+					      u8 cmd_version,
+					      struct ec_params_charge_control *req,
+					      struct ec_response_charge_control *resp)
 {
-	int ret;
 	static const u8 outsizes[] = {
 		[1] = offsetof(struct ec_params_charge_control, cmd),
 		[2] = sizeof(struct ec_params_charge_control),
 		[3] = sizeof(struct ec_params_charge_control),
 	};
+	size_t insize = resp ? sizeof(*resp) : 0;
+	int ret;
 
 	ret = cros_ec_cmd(cros_ec, cmd_version, EC_CMD_CHARGE_CONTROL, req,
-			  outsizes[cmd_version], NULL, 0);
-
+			  outsizes[cmd_version], resp, insize);
 	if (ret < 0)
 		return ret;
 
@@ -94,7 +106,126 @@ static int cros_chctl_configure_ec(struct cros_chctl_priv *priv)
 		req.sustain_soc.upper = -1;
 	}
 
-	return cros_chctl_send_charge_control_cmd(priv->cros_ec, priv->cmd_version, &req);
+	return cros_chctl_send_charge_control_cmd(priv->cros_ec, priv->cmd_version,
+						  &req, NULL);
+}
+
+static int cros_chctl_get_ec_status(struct cros_chctl_priv *priv,
+				    struct ec_response_charge_control *resp)
+{
+	struct ec_params_charge_control req = {
+		.cmd = EC_CHARGE_CONTROL_CMD_GET,
+	};
+
+	lockdep_assert_held(&priv->lock);
+
+	return cros_chctl_send_charge_control_cmd(priv->cros_ec, priv->cmd_version,
+						  &req, resp);
+}
+
+static void cros_chctl_set_default_state(struct cros_chctl_priv *priv)
+{
+	priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+	priv->current_start_threshold = 0;
+	priv->current_end_threshold = 100;
+}
+
+static bool cros_chctl_sustainer_limits_valid(s8 lower, s8 upper)
+{
+	return lower >= 0 && upper >= 0 && lower <= 100 && upper <= 100 &&
+	       lower <= upper;
+}
+
+static int cros_chctl_adopt_ec_mode(struct cros_chctl_priv *priv, u32 mode)
+{
+	switch (mode) {
+	case CHARGE_CONTROL_NORMAL:
+		priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		return 0;
+	case CHARGE_CONTROL_IDLE:
+		priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		return 0;
+	case CHARGE_CONTROL_DISCHARGE:
+		priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
+		return 0;
+	default:
+		dev_warn(priv->dev, "unknown charge control mode %u\n", mode);
+		return -EINVAL;
+	}
+}
+
+static int cros_chctl_adopt_ec_state(struct cros_chctl_priv *priv)
+{
+	struct ec_response_charge_control resp = {};
+	s8 lower, upper;
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	ret = cros_chctl_get_ec_status(priv, &resp);
+	if (ret < 0)
+		return ret;
+
+	lower = resp.sustain_soc.lower;
+	upper = resp.sustain_soc.upper;
+
+	/*
+	 * Valid sustainer limits mean "auto with thresholds". The EC mode may
+	 * be IDLE/DISCHARGE while the sustainer holds or bleeds SoC; do not
+	 * expose that as inhibit-charge / force-discharge.
+	 */
+	if (cros_chctl_sustainer_limits_valid(lower, upper)) {
+		priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		priv->current_start_threshold = lower;
+		priv->current_end_threshold = upper;
+	} else {
+		ret = cros_chctl_adopt_ec_mode(priv, resp.mode);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Sustainer off is lower=upper=-1 → Linux "no limit" (0/100).
+		 * Any other non-valid pair is unexpected; remap and warn.
+		 */
+		if (!(lower == -1 && upper == -1))
+			dev_warn(priv->dev,
+				 "invalid EC sustainer limits (%d/%d), treating as no limit\n",
+				 lower, upper);
+
+		priv->current_start_threshold = 0;
+		priv->current_end_threshold = 100;
+	}
+
+	dev_dbg(priv->dev,
+		"adopted EC charge state: behaviour=%d start=%u end=%u (ec mode=%u)\n",
+		priv->current_behaviour, priv->current_start_threshold,
+		priv->current_end_threshold, resp.mode);
+
+	return 0;
+}
+
+static int cros_chctl_init_state(struct cros_chctl_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	cros_chctl_set_default_state(priv);
+
+	/* v1 cannot report current state; force a well-known EC configuration. */
+	if (priv->cmd_version < 2)
+		return cros_chctl_configure_ec(priv);
+
+	ret = cros_chctl_adopt_ec_state(priv);
+	if (ret < 0) {
+		dev_warn(priv->dev,
+			 "failed to read EC charge state (%d), applying defaults\n",
+			 ret);
+		cros_chctl_set_default_state(priv);
+		return cros_chctl_configure_ec(priv);
+	}
+
+	return 0;
 }
 
 static int cros_chctl_psy_ext_get_prop(struct power_supply *psy,
@@ -152,7 +283,6 @@ static int cros_chctl_psy_ext_set_threshold(struct cros_chctl_priv *priv,
 	return 0;
 }
 
-
 static int cros_chctl_psy_ext_set_prop(struct power_supply *psy,
 				       const struct power_supply_ext *ext,
 				       void *data,
@@ -305,13 +435,8 @@ static int cros_chctl_probe(struct platform_device *pdev)
 	priv->battery_hook.add_battery = cros_chctl_add_battery;
 	priv->battery_hook.remove_battery = cros_chctl_remove_battery;
 
-	priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
-	priv->current_start_threshold = 0;
-	priv->current_end_threshold = 100;
-
-	/* Bring EC into well-known state */
 	scoped_guard(mutex, &priv->lock)
-		ret = cros_chctl_configure_ec(priv);
+		ret = cros_chctl_init_state(priv);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

