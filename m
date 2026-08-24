Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD545A297
	for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586997; cv=none; b=he1WP29TYtS0nYHtc9Fb3NhOZNK0Fz+59DsIEcREYGNonSP2K2ZtRm9zQkhzunv/jLUpFe7c7a86v07teGfw+49uAxkuapWKnLGZMKX7bfcdeDnzN2LSbydnZLBAGd2eMkZDroDt5mWZR7Z1Dg8prVe7ORYMKYGkL8AUhajYZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586997; c=relaxed/simple;
	bh=8SXzDdT7GWUWhSoa0ayu0NCwuv9AWuYg7CMOfT3V5/o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sct0Gghr3mq+GwuJT+Kj/DMXhtDhxm3DpntJkUXwbOkHmGWRHwPBB4swRixtSLA5rjveZxtQGKVTXwBA7WAwfi6k2BBA+T+/lK0eIo9DWgiZKRq4RYV3koRpZPxOMjM0oecAG7Yl4WuV7arX3TESCivlKDlx6f1DCOdVEEhc6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VPcOsO1H; arc=none smtp.client-ip=209.85.208.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPcOsO1H"
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a17b120554so12411551fa.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787586991; x=1788191791; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QIiBqNSDDVOkhse3dzgdWszMb+AaDTWW+ZJrLhjzFtY=;
        b=VPcOsO1HSj/U3GMPR05XGhcVu9XX3i6WkbuY3xo21jsRPu8vbniqLkvJ67Eff0/ov4
         gd2vuKm/qDIwPT39wWcS0LCFqd4RisIn6z36u9DNcyo0T5ICm+Iw4zi1ZomYR0CdLx41
         +nYuKx1khSvhiFcNYNW8f39ZxMFvp9VKgiDbezhxSQv5vCgPhkwcAuLuk/Wx0gOGlyus
         AOngXOuuiBo1d7rB4AU0ICqIQxkRqIzvGYG6pBIMRTjw1GKVAoIIJxCs0SaEHK2aSK41
         tlkTkKaY/WnhlfZ41AWRB3rADTC0KHxC4taksZfuKFuti9t1SThmW/lT1rYDYClAwS/L
         7cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586991; x=1788191791;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIiBqNSDDVOkhse3dzgdWszMb+AaDTWW+ZJrLhjzFtY=;
        b=loOqS2AGCK95BDc0p1GKxGvks+5DKhPNaBZDYd3lw42IlziwDjWWxPZfK9VtOjIK1H
         Euw4UoZYPTvkSvlEpg1fNk9DT4I0dLH5L5OkpPDnDyk/WrQLUV3TWrfv2UggEiaIRNU/
         9FF/gwze8uD+fX+5F7dPMB19gCNKrh7Fwk3wiDJiONEWqaazs5VWJXmewDyNYvzbaz1V
         ZarEEbew7s4r5wLb/D86XfK66R5cg7Wydkp53Y4KqsYUK/TYBgYopeSZP350k1xAXert
         oKmkHxuGZS9EO8rltTtnmIi2+1iPLVgYTra9DcBEMOFBwcFfa+GpEnkjzfsfM4Zc8dg4
         6zjw==
X-Forwarded-Encrypted: i=1; AHgh+RqS8MnHQXmsihz+YN7ZDiUe5P4o+8tPDVMWUslE/k33zf9JPmKHqOc9W6Xu+mlfpmYMcPuHdFiXlDV6ihQuITw=@lists.linux.dev
X-Gm-Message-State: AFuF++l/lvwVqFbyg8uMX09NSuz7NOBGi+hEykZt6UG4n37yfwLm8qX5
	+bF8QXq6t54Al6UxP+6ZaRyrSG7d0QJ5KkQSBY/YA8vfGZd7ENGVx72xu0WoYcfShEMS52eiN6Q
	Ck7YOvjm/3A==
X-Received: from ljqx34.prod.google.com ([2002:a2e:a9a2:0:b0:3a1:7f0f:2a05])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:a20f:10b0:3a1:5172:c287
 with SMTP id 38308e7fff4ca-3a1aebdb861mr45321331fa.5.1787586991037; Mon, 24
 Aug 2026 08:56:31 -0700 (PDT)
Date: Mon, 24 Aug 2026 15:55:54 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260824155554.1046334-1-dbalint@google.com>
Subject: [PATCH] platform/chrome: cros_ec: add API for power monitoring
From: Daniel Balint <dbalint@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	jakiela@google.com, hmazur@google.com, Benson Leung <bleung@chromium.org>, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Add new EC host command and MKBP event to allow cros_ec_pwrmon
iio devices to query the EC for power monitoring data.
The actual cros_ec_pwrmon driver using this API is currently downstream
and will be upstreamed at a later date. This is a sync between the EC
header and the kernel.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 .../linux/platform_data/cros_ec_commands.h    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 749d985e9da2..a7bd69d83522 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1344,6 +1344,26 @@ enum ec_feature_code {
 	 * The EC supports UCSI PPM.
 	 */
 	EC_FEATURE_UCSI_PPM = 54,
+	/*
+	 * The EC supports Strauss keyboard.
+	 */
+	EC_FEATURE_STRAUSS = 55,
+	/*
+	 * The EC supports PoE.
+	 */
+	EC_FEATURE_POE = 56,
+	/*
+	 * The EC supports a hybrid boost charger
+	 */
+	EC_FEATURE_CHARGER_HYBRID_POWER_BOOST = 57,
+	/*
+	 * Support signaling new console logs via host event
+	 */
+	EC_FEATURE_CONSOLE_LOG_EVENT = 58,
+	/*
+	 * The EC supports power monitoring
+	 */
+	EC_FEATURE_PWRMON = 59,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
@@ -3516,6 +3536,9 @@ enum ec_mkbp_event {
 	/* Peripheral device charger event */
 	EC_MKBP_EVENT_PCHG = 12,
 
+	/* Power monitor telemetry event */
+	EC_MKBP_EVENT_PWRMON = 13,
+
 	/* Number of MKBP events */
 	EC_MKBP_EVENT_COUNT,
 };
@@ -3599,6 +3622,12 @@ union __ec_align_offset1 ec_response_get_next_data_v3 {
 	uint32_t cec_events;
 
 	uint8_t cec_message[16];
+
+	struct __ec_todo_packed {
+		int64_t value;
+		uint32_t samples;
+		uint8_t channel_id;
+	} pwrmon_data;
 };
 BUILD_ASSERT(sizeof(union ec_response_get_next_data_v3) == 18);
 
@@ -6589,6 +6618,49 @@ struct ec_params_usb_pd_mux_ack {
 	uint8_t port; /* USB-C port number */
 } __ec_align1;
 
+/**
+ * Power monitoring. Used to read power consumptions on rails
+ */
+#define EC_CMD_PWRMON 0x0608
+
+enum ec_pwrmon_cmd {
+	EC_PWRMON_GET_CHANNEL_COUNT = 0,
+	EC_PWRMON_DUMP_INFO = 1,
+	EC_PWRMON_SET_RATE = 2,
+	EC_PWRMON_GET_RATE = 3,
+	EC_PWRMON_START = 4,
+	EC_PWRMON_STOP = 5,
+	EC_PWRMON_LATCH = 6,
+};
+
+struct ec_params_pwrmon {
+	uint8_t cmd;
+	union {
+		uint16_t set_rate;
+		uint8_t channel_id;
+	} __ec_align2;
+
+	/*
+	 * The following commands have no args:
+	 *
+	 * start, stop, latch
+	 *
+	 */
+} __ec_align4;
+
+struct pwrmon_dump_info {
+	uint8_t channel_id;
+	char channel_name[32];
+} __ec_align4;
+
+struct ec_response_pwrmon {
+	union {
+		uint16_t sample_rate;
+		uint8_t channel_count;
+		struct pwrmon_dump_info dump_info;
+	} __ec_align4;
+} __ec_align4;
+
 /*****************************************************************************/
 /*
  * Reserve a range of host commands for board-specific, experimental, or
-- 
2.55.0.766.g2966f0265a-goog

