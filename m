Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94623C8CD
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197109; cv=none; b=G2ZP9pzDxQ5LQbdLlwODnVl49AUopZtrIsSJJO/ek6QZFtDJrRq1rs+9nWZuNykgM+zusI9I4ryCIVqujbhThk0+6edRLRmlM5/3JHlNW4fIB+dwxNtjHvvc4hCMH2LyozkRv3CPvbJpkpOcsGXFexRk+TYEf/Mi1OLKAT389Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197109; c=relaxed/simple;
	bh=30zjWy/jj97FoKyfLjbsSZTkzTbcjQ4czjm4EU8wGs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiw+IZxWM93Rpp/JZn5zv4lo0ouPPdAXUR14neup9tguE6DBEPM5btjH2pLJzrmSLB1qqnTUujUs/ZfAVa2ZeSs+/yVxyQxbJ1iv6APKSoPVeP8ZNrwQabqfKsbLOddGY7WoadzgXLPfsWocj4W2vpRJOnrXfl1cMSFBsHWt+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A8Hvqsb8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A8Hvqsb8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78e70c5so206288966b.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197105; x=1755801905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtcHdgDQ94Hb+lE3OrQOh7GvxJZixH0xu7gYTYaPGEQ=;
        b=A8Hvqsb8VyJeU7ErmKDC0RFuNoLLvbEfgNkIMWx9QrD5fnJ5YBlFmysb3DsgonI6hc
         izKPAGbdQKUSMD8IHj20fl+H8jTz/CEAZgH+E7IdBaRLzwhuLlWKjPO54msrfq3Mh6xZ
         yF2Mnkjh7QMGtJDtXkVfx0Fn6w8kF2XOIAmBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197105; x=1755801905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtcHdgDQ94Hb+lE3OrQOh7GvxJZixH0xu7gYTYaPGEQ=;
        b=SAb9359RfWoZYwotVUIq9l1C0AsbU2qytukBN+lRsw+0Oxd923jNnlEX6fekNM4eCr
         GjCCvHxzZyRd8I9LPaRIy/2G4mbFNAqeJFHi/CvMDCnBZfErTLmdLoafRafTd2tcKfCF
         525GRhhZK9XGS4NT2QmtEAqKZgyJw2tdV8CUpGFm6pqGeWDIBPU7ubn7sZMGR1/Qbp/k
         DdFRzXs6gfv7kb+opRXJg9BNi+ptjDJ1ByViprNQDSgvIWIRAs8OS2Rle6m9riOk+Lbk
         kDfO2sKfQb1+5nqr6XghXOq77qvtLjbUGviFztS7Ek6+REEtXdgiLXcbBvUVm5sqoczJ
         pv9w==
X-Forwarded-Encrypted: i=1; AJvYcCWzC1xRJaWB32FQWDwi5he/WJRc4hS8AQG/ljm54uangdAEp4sTa64fYY+qO32HIUeECCUI5XdIMN8ldcJNbAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwydSvPuiehvChfKFmRGJSK5TEcCMgvIo0510MZ+d6eLIjGjkB9
	+MaRhA8nEoVXvsgehbpWoaV5fMcmkUjbphcwJ3hin/g8XiCVq0/81SOFFVjwfK4tTg==
X-Gm-Gg: ASbGncvWJcAfCgRNZQA8wQihOTW2W38AH3uDg6GUHt5OLDj/N2nXOS9w9P6hd7go7hn
	eraxUX2FcUdI8bg7U8oidx6z5dbUVtYgffU4jpJSHIcGDNcT1HUB+h3OnjHCNUftsDeF+rEQnqt
	Rf6EKOh3rU5OvAlKuGTtxuB8qM1XGFSs9c/ozIkLYxHwCkZB+nt9ssOEL1ulPt993DoztjbBgYB
	oFXR/R8DaF17VpgvmifOZ4LYAlCiVAHS0qPsD5wcUpyT5HiFitVU+Weq0sCXqwfZAsTjJFI501R
	uN2cHuKRy9pB1iq7HE7mq1Fr9Wuh6WcMighmlUpnoE00N+kF3/nMnRSJa55ros2KvHQ+Z/AYhLK
	kkcPfSsOgOcaxGuv0wSGIOwzHXbF9adc0oQEanpFyAu0q5RwUu0wwNgGYCMZ4hAHOxgvc40f2SA
	PbFAGaw1UJmTrr
X-Google-Smtp-Source: AGHT+IHoIrfJieVmQqqm3tABVLHMdomEesJIxLp5AlDzkO4kP3URJ9mRpKR3pWGnoYuK6U7MbaKtaA==
X-Received: by 2002:a17:907:2d1e:b0:ae3:5368:be85 with SMTP id a640c23a62f3a-afcb990124fmr316622966b.47.1755197105489;
        Thu, 14 Aug 2025 11:45:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:05 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 4/5] usb: typec: Implement alternate mode priority handling
Date: Thu, 14 Aug 2025 18:44:54 +0000
Message-ID: <20250814184455.723170-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces APIs to manage the priority of USB Type-C alternate
modes. These APIs allow for setting and retrieving a priority number for
each mode. If a new priority value conflicts with an existing mode's
priority, the priorities of the conflicting mode and all subsequent modes
are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/Makefile         |   2 +-
 drivers/usb/typec/class.h          |   1 +
 drivers/usb/typec/mode_selection.c | 127 +++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |   8 ++
 include/linux/usb/typec_altmode.h  |   9 ++
 5 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index f05d9201c233..c6467e576569 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -82,6 +82,7 @@ struct typec_port {
 	struct device			*usb3_dev;
 
 	bool				alt_mode_override;
+	struct list_head		mode_list;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..8a54639b86bf
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include <linux/usb/typec_altmode.h>
+#include <linux/slab.h>
+#include <linux/list.h>
+#include "mode_selection.h"
+#include "class.h"
+
+static const char * const mode_names[TYPEC_ALTMODE_MAX] = {
+	[TYPEC_ALTMODE_DP] = "DisplayPort",
+	[TYPEC_ALTMODE_TBT] = "Thunderbolt3",
+	[TYPEC_ALTMODE_USB4] = "USB4",
+};
+
+static const int default_priorities[TYPEC_ALTMODE_MAX] = {
+	[TYPEC_ALTMODE_DP] = 2,
+	[TYPEC_ALTMODE_TBT] = 1,
+	[TYPEC_ALTMODE_USB4] = 0,
+};
+
+static inline enum typec_mode_type typec_svid_to_altmode(const u16 svid)
+{
+	switch (svid) {
+	case USB_TYPEC_DP_SID:
+		return TYPEC_ALTMODE_DP;
+	case USB_TYPEC_TBT_SID:
+		return TYPEC_ALTMODE_TBT;
+	case USB_TYPEC_USB4_SID:
+		return TYPEC_ALTMODE_USB4;
+	}
+	return TYPEC_ALTMODE_MAX;
+}
+
+/**
+ * struct mode_selection_state - State tracking for a specific Type-C mode
+ * @mode: The type of mode this instance represents
+ * @priority: The mode priority. Lower values indicate a more preferred mode.
+ * @list: List head to link this mode state into a prioritized list.
+ */
+struct mode_selection_state {
+	enum typec_mode_type mode;
+	int priority;
+	struct list_head list;
+};
+
+/* -------------------------------------------------------------------------- */
+/* port 'mode_priorities' attribute */
+
+int typec_mode_set_priority(struct typec_altmode *adev, const int priority)
+{
+	struct typec_port *port = to_typec_port(adev->dev.parent);
+	const enum typec_mode_type mode = typec_svid_to_altmode(adev->svid);
+	struct mode_selection_state *ms_target = NULL;
+	struct mode_selection_state *ms, *tmp;
+
+	if (mode >= TYPEC_ALTMODE_MAX || !mode_names[mode])
+		return -EOPNOTSUPP;
+
+	list_for_each_entry_safe(ms, tmp, &port->mode_list, list) {
+		if (ms->mode == mode) {
+			ms_target = ms;
+			list_del(&ms->list);
+			break;
+		}
+	}
+
+	if (!ms_target) {
+		ms_target = kzalloc(sizeof(struct mode_selection_state), GFP_KERNEL);
+		if (!ms_target)
+			return -ENOMEM;
+		ms_target->mode = mode;
+		INIT_LIST_HEAD(&ms_target->list);
+	}
+
+	if (priority >= 0)
+		ms_target->priority = priority;
+	else
+		ms_target->priority = default_priorities[mode];
+
+	while (ms_target) {
+		struct mode_selection_state *ms_peer = NULL;
+
+		list_for_each_entry(ms, &port->mode_list, list)
+			if (ms->priority >= ms_target->priority) {
+				if (ms->priority == ms_target->priority)
+					ms_peer = ms;
+				break;
+			}
+
+		list_add_tail(&ms_target->list, &ms->list);
+		ms_target = ms_peer;
+		if (ms_target) {
+			ms_target->priority++;
+			list_del(&ms_target->list);
+		}
+	}
+
+	return 0;
+}
+
+int typec_mode_get_priority(struct typec_altmode *adev, int *priority)
+{
+	struct typec_port *port = to_typec_port(adev->dev.parent);
+	const enum typec_mode_type mode = typec_svid_to_altmode(adev->svid);
+	struct mode_selection_state *ms;
+
+	list_for_each_entry(ms, &port->mode_list, list)
+		if (ms->mode == mode) {
+			*priority = ms->priority;
+			return 0;
+		}
+
+	return -EOPNOTSUPP;
+}
+
+void typec_mode_selection_destroy(struct typec_port *port)
+{
+	struct mode_selection_state *ms, *tmp;
+
+	list_for_each_entry_safe(ms, tmp, &port->mode_list, list) {
+		list_del(&ms->list);
+		kfree(ms);
+	}
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..69adfcf39d7c
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
+
+int typec_mode_set_priority(struct typec_altmode *adev, const int priority);
+int typec_mode_get_priority(struct typec_altmode *adev, int *priority);
+void typec_mode_selection_destroy(struct typec_port *port);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..318858fc7bec 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -145,6 +145,15 @@ enum {
 
 #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
 
+#define USB_TYPEC_USB4_SID	0xff00
+
+enum typec_mode_type {
+	TYPEC_ALTMODE_DP = 0,
+	TYPEC_ALTMODE_TBT,
+	TYPEC_ALTMODE_USB4,
+	TYPEC_ALTMODE_MAX,
+};
+
 struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *altmode,
 					     enum typec_plug_index index);
 void typec_altmode_put_plug(struct typec_altmode *plug);
-- 
2.51.0.rc0.215.g125493bb4a-goog

