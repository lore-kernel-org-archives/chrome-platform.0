Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1349EC60
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963819; cv=none; b=R6YWFGOUXkukztPF0m/QAYt+WDPpQtlc9nhsjDZAGmQg5sR8ZDuzP98O8Wo/ysO/9kHuZ1roMOycBAjNFwUPXlPZxzdJi8GDv+UCMrWtruENdG4XW0XBoRp5r0MtsphL68qcGttWYUG2OuEaTq3bl4v1kFcSeBqVGrFyZgFUJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963819; c=relaxed/simple;
	bh=AQufZVavRTbYJYN2f6gGGWx6gsk/fIdF/5LI84j40lQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T/rCYe8K0K0aibe1lKoS2WtMFU/L1VQz6bmpfz6qTGkH8QiAhA3CU0p4CTp7YH/kQtgPj4z3JlhkP3B89+3dgVZb9vObdmMyfluQB0omidR616IpUiJw+3gF5CVAIMar9JbXSp8SQ4xRjQe6K8SLL3ZAnMkNKKRNkLdvFMlX0FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXoOabsD; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXoOabsD"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac50dc68adso1046250a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963807; x=1792568607; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxvAeDOOTPRLx7Cf6b44fOAyQ4LJCEO6jlOtNXuHCIA=;
        b=GXoOabsDhHEjb9BE99EmobNgdp32kYzUzTzCXoSHQ8eCKhnn0wzc/vAwiZciFNNqBB
         GlBCwVxESIwZ2sX8nLgphmEYCdEucWoCtQy9NrOPNZUG8d3s6f0xXAFlM8XelRBJ+Xg+
         yhj+4q3ufCVfL9FLv7GEvcJcJwP7aNnMufKQasVac/rx+16iLl//ilwLG4drmbxGuXYt
         V07NlDNeqYFKZPUm71uFfNS8E+jVfWeT0zxkmfvARDr5rGztVhmabYBCoJriyHQWckFK
         v4+mzUThY3lobLOfgynYonYgagl2gw0Z+tmBsyAHXClnUL/g6BbAHMytVD6xsSYvmwv3
         OOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963807; x=1792568607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxvAeDOOTPRLx7Cf6b44fOAyQ4LJCEO6jlOtNXuHCIA=;
        b=nwFE8ROGQ/ELFtJrA8sTefuDZozwNe1MSrBCk3DFx8o0LphvFv0dCYn9VOTDRQE5PI
         gg+xdpR8HWCyxYhQT1JOjJ/a19Ipe49rDc7P1kUyNHEzPmVuSJZU2PSLPhk8S/6xtnXb
         OjwTIn5S+TW0InSopoI+y5JpldVGYwMnhhgzlKLXgWT9BzEHYWHk7kCs9TzbVWjEt+3n
         aLNssSm+7fc6zdqpFw3MmITqnixbA7zU95L4b7ucHMpSV1bBWsonAhkSZXNKpuIV3NDw
         hBKWSUJEoe8KkAAn0XnIbDmq+RqBTHCfyDco8Rc7DBKydGAw2jiJ76cTczdHhmlQPZ+B
         bi0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfDMZrOPcQ4eCXpHlB+2nB/IvscmRFLBJsf3YD/Sggvn/h2B/W8OD/TgcxqMKnxRJayJFMc+MIkhIR8z8Hr04=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRQRaPq6lWHzVwzLAqJoKcrBeMpuoMICrzAdnPWvemsyxrld/Q
	lTJpl9JlB7jEngsWOwxyFJZqlT8Uf2Q4R8xvN6gmv2VPa6zmzfH6QmhlXm8q/nTV3fdo6FTlTaX
	3DjvvbsVkrfkIiA==
X-Received: from pgww24.prod.google.com ([2002:a05:6a02:2c98:b0:ccb:62e:3f27])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e70c:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3ab3ad2b1admr11297561a91.39.1791963806944;
 Wed, 14 Oct 2026 00:43:26 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:05 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-6-sgsatyam@google.com>
Subject: [PATCH v5 5/6] platform/chrome: cros_ec_sensorhub: Increase
 TS_HISTORY_BORED_US to 2s
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Increase the TS_HISTORY_BORED_US gap threshold from 0.5 seconds
(500,000 us) to 2.0 seconds (2,000,000 us) to accommodate normal sensor
batching flush intervals (which can be 1 to 2 seconds long) without
repeatedly tearing down the timestamp filter, while still resetting the
filter across actual long idle gaps or suspend.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 4d814e2d7297..7740bb42b1df 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -30,9 +30,13 @@
 
 /*
  * If we don't have any history entries for this long, empty the filter to
- * make sure there are no big discontinuities.
+ * make sure there are no big discontinuities (e.g. after suspend or long idle).
+ *
+ * This is set to 2 seconds to accommodate normal batching flush intervals
+ * (which can be up to 1-2 seconds) without constantly resetting the filter,
+ * while still ensuring a reset occurs during actual long gaps or suspend.
  */
-#define TS_HISTORY_BORED_US 500000
+#define TS_HISTORY_BORED_US 2000000
 
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
-- 
2.56.0.385.gd3acb90ef8-goog

