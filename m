Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC323AF674
	for <chrome-platform@lists.linux.dev>; Thu,  1 Oct 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845108; cv=none; b=fdPY5hvb/Mla9uiQo1hTEb3x+An2lBulV7RLf4XiiJXUpciqGEh1rVf/qGTEKOrhMlM+M89qYj/C6BZX5234HxjFSi/LrRi+oj1q+wjMptEaGMsz81a9EFETD2jsgIx5AvYw4Dc60AjLTAmStaynoYPY6ZqZvdGvZiCmP9QQOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845108; c=relaxed/simple;
	bh=SG5l1/p8ecPYW54jL6ocKKDDW9cv0xxmUCyMF618z/I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mWIt/3BL6hXuoaw1bVWstGIyTQ0j04Ri62boYvcF/p3lV/NEz+Dcdwpp14bxZcCWHdksioIgSmQHUJmL0c17sv+QrEEMeviW50dO7ZxpYcKl2kbn5l/FmwV9X31hE5t3Yv08y51fM6ydzMok+Xcv/x/FC2pI1xUV7weD2F325IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bszpila.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AogwKMxE; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bszpila.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AogwKMxE"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so53538955e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 01 Oct 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790845105; x=1791449905; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHxr7P6HLK9FY/BqDMDIVmU6sE2kzbtuiJznajQTYVg=;
        b=AogwKMxE31lEu23xQEw4ddMrerYRzrVxVRPFxReNYhezvFb382/BvWO0oBeuW5GlRa
         acDklpeQ8wi/TLUVR4TdJlHRVe5JQavHHzo3Lu/DcTuVRAndvbhmgxu4Cb1nEN5GRWTR
         AfVPXb/LXJWWBnGopK3Rn2GiowgGg/GXja6WjVWh2AA+WdpWq2ZjjwNERkzgHqlwFDCI
         Xd53Ne7HbznETy4660zFU0qcxT4KxceLWNm33jHK4j+Pbb1Pm6iUpVfkxuDjZzoBkD1g
         JIP0kt/dXO/K4YyEXVVIwKPsEuZ+aj8+e65BTqHN6YKYABX0yom+oFI6D7r+AzMnGxSs
         /JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845105; x=1791449905;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHxr7P6HLK9FY/BqDMDIVmU6sE2kzbtuiJznajQTYVg=;
        b=LFpQ5l2IFHG8vwc9EKJaDns01SZToKgU/6T7eui4AKMjKYPiI2oq3CX/Nivbpj7frg
         dHZOn6lMOQuGJNiXd8brhDabKyYk4H06RkUTW9fcajXPJWhmohdSzbv/Bn7bMub9Qjz8
         Ox5j3nLslqbZM7H6i1yA7X3XWuCOpKG2yKwgWxFq3REtn+hr5iMNl5uO0QgggQVBq2jE
         +ZeuOVeUeMp0J8jBEQSoVRPxl41wjsdDMSQlt6SdbgMfFedYBAU0pL5KR6ryt0SQJm9N
         d8QeeTAUxT5ms7N9wd9iSl9DDxtoGOZzWuV9M9U4TSpPOOjDQGSZixDPY00sbvtX0a/k
         q1cA==
X-Forwarded-Encrypted: i=1; AKwUvBwyFeD7/EXehemgz3wB5ky3TmxQn8ttje+z7veI50dwMa8NUl88zBdmEEjhdeJ+VKZ0OqkRgHXpvG1spX2LkE8=@lists.linux.dev
X-Gm-Message-State: AFuF++nWwOuuVz5gqNClzSfDvu5S0393L7UswcbuSQgmpnFCh7tfotmt
	k5rEMcsSZgnccu3DoAcyP+6JUx6wB6Izythy/qYcoeSZFfHTuolR+IGde0LIkbhmq6BNpIE6+2v
	61fIM4axJJg==
X-Received: from wmgb4.prod.google.com ([2002:a05:600c:1504:b0:4a0:130e:8c8c])
 (user=bszpila job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c3cb:10b0:4a0:1f90:5951
 with SMTP id 5b1f17b1804b1-4a01f9059f3mr20614605e9.27.1790845105001; Thu, 01
 Oct 2026 01:58:25 -0700 (PDT)
Date: Thu,  1 Oct 2026 08:57:13 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001085714.1086242-1-bszpila@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Validate SVID and mode counts
 in discovery data
From: Bartosz Szpila <bszpila@google.com>
To: tzungbi@kernel.org, bleung@chromium.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

cros_typec_register_altmodes() iterates over sop_disc->svid_count and
sop_disc->svids[i].mode_count from the EC_CMD_TYPEC_DISCOVERY response
without validating their bounds.

port->disc_data is allocated as a buffer of EC_PROTO2_MAX_RESPONSE_SIZE
bytes, and each SVID entry contains a fixed mode_vdo[6] array. If the EC
returns an out-of-bounds svid_count or mode_count, the loops read past
the end of the mode_vdo array or the disc_data buffer.

Validate that the discovery response with svid_count entries fits within
EC_PROTO2_MAX_RESPONSE_SIZE using struct_size(), and ensure each SVID's
mode_count does not exceed ARRAY_SIZE(sop_disc->svids[i].mode_vdo)
before registering altmodes.

Signed-off-by: Bartosz Szpila <bszpila@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7..4427897eb3f5 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,8 +7,10 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_device.h>
@@ -894,7 +896,15 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 	int ret = 0;
 	int i, j;
 
+	if (struct_size(sop_disc, svids, sop_disc->svid_count) > EC_PROTO2_MAX_RESPONSE_SIZE)
+		return -EINVAL;
+
 	for (i = 0; i < sop_disc->svid_count; i++) {
+		if (sop_disc->svids[i].mode_count > ARRAY_SIZE(sop_disc->svids[i].mode_vdo)) {
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
 		for (j = 0; j < sop_disc->svids[i].mode_count; j++) {
 			memset(&desc, 0, sizeof(desc));
 			desc.svid = sop_disc->svids[i].svid;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

