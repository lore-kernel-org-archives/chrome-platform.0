Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11B5401A08
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659811; cv=none; b=arEhYGhxThHtfFxl6ouJQxb/PY1mm1gfMsrJvU+6bxz8k8RIay7yIRriQ/7X85ozo1W5RUvBsXwnfpWDOGCpUU8OXp30sV5tTPlW+9iHGLZY35przwXDIWu/vnFNtQxVMtkYsnglqpIZbn/HOeLAG0y1eqncnqoUy0WJ+OU1pxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659811; c=relaxed/simple;
	bh=8ITZt2wBHZZdTs2DpxzxP5k4/k1k9rbpaZSwHeD+pLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4V0LvXZqqgi4xuIieZudYjdpeN/ptukjDNv7Z1qs3Vxe0p7O3a2r2Fi8SOB3J5K/egAZAJumeif+8ycqYN/yXE/F83wTcERAeh2nf4+r6OhCgqH5WSqPWJCBmAJu/pE2BCFtXWW6lxXgYpsthca8PDPNIF/4P7EkSb4I1Td8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7kVm4Vw; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7kVm4Vw"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb61bbeb25so5795543a34.1
        for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659798; x=1788264598; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3ZWyjOYMOtjykrHLScPAtNYPY3rrra1A30T9BgJzlo=;
        b=I7kVm4VwogMS1kEXp1S0iBmpg/XhKPlPEnGYNm9+zvHB30eCHPwZMyRbr3jC+eWu62
         zsKKQMsnG0bO7+t6/56Nl9YhImNWeuUIaWveYIDeaj//Ga1lrQ1uNNJ10JCrUvxH1SXy
         aOawQp/XnmCE1RAYgTGpEjKA6MuzAZRbdb6xpMXkexelrG0HxjQf/TUJpgZf7nD9AErc
         r0vfHO20NIZwZQU3nlkme565xzePGT0bAsuoz10Zxz3MPDcD1GMIB6W3Bp54AFnfqaZp
         KeYQHJgr5KOiAXZFn5CiFKydhYl+Ie7Z+7jSV6j+Q++8ZlqS/IzZCEQmsKi/h4t2eCsf
         4QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659798; x=1788264598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3ZWyjOYMOtjykrHLScPAtNYPY3rrra1A30T9BgJzlo=;
        b=KAqbYZ6Vul7KhKriD9KGUrO9VfriiQMnAxxgRHIvkxFEmkUrYYv+KW7JRcHfIWbin1
         h1ab6PJQyTN403/pRb3SJpvko8R1zAGuNK62wKcZsNC0vOHkK7p0namJsYHcTIOgxtNc
         xwMN53PremGkq8sAhIkoaTZX4MS1qKjpVZ9N0DncHDIndqGTnCM0zjtfAjpZ6nJPiCSx
         GWrTS76be413wIlHZbCm74svZZ6yccWfXL3r2IApr7b4b78gmn4aMMz1WSL5hiYlmvAq
         vFA2+ceInfszaS4/M5xa2iUPY3Jb61hPYBz7H58raEmeAzOmv8Bem1elE1x8jASviAX1
         GxTg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Rd0VMSIcNc6jiWyTVp7n+PrOnWJCUGfukYKSKJd530w+lS4Awn2Qr5BJkT5pKNhRHiKevIluGwgmw94pVrk=@lists.linux.dev
X-Gm-Message-State: AFuF++l7sVfEAvQ2y72wCxQr3vuNsy53jHkeMsYiCpmXsTNLsHE4crRD
	MBupg6zxd6sC99WxLLh4rJm3YSPxNMgRs+3LxtSxNM+bVPh/t7CgUKow
X-Gm-Gg: AR+sD12FjdCBq0o7i/3i6WPqc4zwDpAwyLI921aHcvL+OrseZ3ChaW4zfGpb7C1m1fC
	2YcnQ6QNozU3p9FlWM8rVJZKLbSOezV91bFlku3Jp0I8F84CrKHj5D5JsGLWRIMTysftGnX9nOB
	2sMhaBXdc71CsfDNWBM548hWoYO/dCUWgUyqtPl8iyv8IC1+93dn26OHv8e6uvdo5jkgBAFDPDr
	vk83G5mDXjI9NEblTnvxRFjqNpNyQvJ1qTXWwh1CTP0K6A9u5a77rfytWNLMDDjT7vVHs1bs0Ol
	Gwt6EV+61fMHzEw8LXsC4uUYhaX2zMwp8ZRgMX3Gd8qKWBHZlMBXniyuedvvHxqI2PeKmrgGbxa
	ppfjP2r6F1wYlCFuY7i9wWgMLEeqgHl2o8cOA//2QvdSbsNDh0cbzYEwRyoUWXjVrOIL2kGGzvH
	DlTRnyTAAt1v3dQ7RBOXFD5YpVHrCRbkFExHOpR7aGrTPjvBhXG+ie2bYAjcmL
X-Received: by 2002:a05:6830:6739:b0:7e9:bd00:c6ad with SMTP id 46e09a7af769-7f4afacc6e6mr5845580a34.16.1787659798318;
        Tue, 25 Aug 2026 05:09:58 -0700 (PDT)
Received: from sh170r6 ([47.221.33.210])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48fb1c290sm6635788a34.8.2026.08.25.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:09:57 -0700 (PDT)
From: Matt DeVillier <matt.devillier@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Matt DeVillier <matt.devillier@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] power: supply: cros_charge-control: adopt EC charge state on probe
Date: Tue, 25 Aug 2026 07:09:00 -0500
Message-ID: <20260825120929.13168-2-matt.devillier@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825120929.13168-1-matt.devillier@gmail.com>
References: <20260824155736.1186510-1-matt.devillier@gmail.com>
 <20260825120929.13168-1-matt.devillier@gmail.com>
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
pairs are remapped the same way with a warning and pushed back to
the EC so the cache stays in sync.

If GET fails, fall back to the previous defaults and SET them on the
EC. Command version 1 still cannot report state and keeps forcing a
well-known configuration.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 drivers/power/supply/cros_charge-control.c | 157 ++++++++++++++++++---
 1 file changed, 139 insertions(+), 18 deletions(-)

diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index e0f168624807..07bcc6a9aeef 100644
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
@@ -44,18 +54,23 @@ struct cros_chctl_priv {
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
 
-	ret = cros_ec_cmd(cros_ec, cmd_version, EC_CMD_CHARGE_CONTROL, req,
-			  outsizes[cmd_version], NULL, 0);
+	if (resp)
+		*resp = (struct ec_response_charge_control){};
 
+	ret = cros_ec_cmd(cros_ec, cmd_version, EC_CMD_CHARGE_CONTROL, req,
+			  outsizes[cmd_version], resp, insize);
 	if (ret < 0)
 		return ret;
 
@@ -94,7 +109,120 @@ static int cros_chctl_configure_ec(struct cros_chctl_priv *priv)
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
+	return cros_chctl_send_charge_control_cmd(priv->cros_ec, priv->cmd_version,
+						  &req, resp);
+}
+
+static void cros_chctl_set_default_state(struct cros_chctl_priv *priv)
+{
+	lockdep_assert_held(&priv->lock);
+
+	priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+	priv->current_start_threshold = 0;
+	priv->current_end_threshold = 100;
+}
+
+static bool cros_chctl_sustainer_limits_valid(s8 lower, s8 upper)
+{
+	return lower >= 0 && upper >= 0 && lower <= 100 && upper <= 100 && lower <= upper;
+}
+
+static int cros_chctl_adopt_ec_mode(struct cros_chctl_priv *priv, u32 mode)
+{
+	lockdep_assert_held(&priv->lock);
+
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
+static int cros_chctl_init_state(struct cros_chctl_priv *priv)
+{
+	struct ec_response_charge_control resp;
+	s8 lower, upper;
+	int ret;
+
+	guard(mutex)(&priv->lock);
+
+	/* v1 cannot report current state; force a well-known EC configuration. */
+	if (priv->cmd_version < 2) {
+		cros_chctl_set_default_state(priv);
+		return cros_chctl_configure_ec(priv);
+	}
+
+	ret = cros_chctl_get_ec_status(priv, &resp);
+	if (ret < 0) {
+		dev_warn(priv->dev,
+			 "failed to read EC charge state (%pe), applying defaults\n",
+			 ERR_PTR(ret));
+		goto defaults;
+	}
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
+			goto defaults;
+
+		/*
+		 * Sustainer off is lower=upper=-1 → Linux "no limit" (0/100).
+		 * Any other non-valid pair is unexpected; remap, warn, and
+		 * push the cleaned state back to the EC.
+		 */
+		priv->current_start_threshold = 0;
+		priv->current_end_threshold = 100;
+
+		if (!(lower == -1 && upper == -1)) {
+			dev_warn(priv->dev,
+				 "invalid EC sustainer limits (%d/%d), treating as no limit\n",
+				 lower, upper);
+			return cros_chctl_configure_ec(priv);
+		}
+	}
+
+	dev_dbg(priv->dev,
+		"adopted EC charge state: behaviour=%d start=%u end=%u (ec mode=%u)\n",
+		priv->current_behaviour, priv->current_start_threshold,
+		priv->current_end_threshold, resp.mode);
+
+	return 0;
+
+defaults:
+	cros_chctl_set_default_state(priv);
+	return cros_chctl_configure_ec(priv);
 }
 
 static int cros_chctl_psy_ext_get_prop(struct power_supply *psy,
@@ -152,7 +280,6 @@ static int cros_chctl_psy_ext_set_threshold(struct cros_chctl_priv *priv,
 	return 0;
 }
 
-
 static int cros_chctl_psy_ext_set_prop(struct power_supply *psy,
 				       const struct power_supply_ext *ext,
 				       void *data,
@@ -305,13 +432,7 @@ static int cros_chctl_probe(struct platform_device *pdev)
 	priv->battery_hook.add_battery = cros_chctl_add_battery;
 	priv->battery_hook.remove_battery = cros_chctl_remove_battery;
 
-	priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
-	priv->current_start_threshold = 0;
-	priv->current_end_threshold = 100;
-
-	/* Bring EC into well-known state */
-	scoped_guard(mutex, &priv->lock)
-		ret = cros_chctl_configure_ec(priv);
+	ret = cros_chctl_init_state(priv);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

