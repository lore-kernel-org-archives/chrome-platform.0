Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E33705B5
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082144; cv=none; b=Vrsr9sx76U3ISpiPgbIUpyxMUmR8OWP18Mw2SxWfDj4JjjOytap0SYnuVyGYkdn/hMTIIURuevXwC6uIhGQ4V/9G3hTHAngcioVl58SlInqE22RYB+sgOZnKuy3PNB3QU9uzHc0Sn6oJY7q2zkT2PZzCGVD57lL+KSx2OaeUuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082144; c=relaxed/simple;
	bh=5N/rH2l80Ktvf6ZOLrQvgwDOrXD0nhEqJ9c02j0Lg4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gw3px25XQwZgBRP/jeQTqfwF/nd4g4mOKAkvJMMARqNpdnNIXop3y+p/TZMC/S8zREIWl6i5nVb9oGX4uFcfbBWjiKJUppyqClUj0zlE2OqBlEnHPSatZzWFPutPnkg5N36daro4kPwVmkKla2x9FzLIvfL73yF+Cl91haY8Mnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IHrT3pZM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IHrT3pZM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b045d56e181so324108366b.2
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082141; x=1757686941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvUNphtUz9Y1R9ktHcB7KtYuXuG0QSWTDzZgUfzVFec=;
        b=IHrT3pZM80ue1GM6mzfo1+yLrdt1FH3q3hq0hbScxQ4GRsg9lpxd8LrcXDIxEd/PiR
         GzoQmh9ZzumJcioc5eFcoTfTv2Undavcp7zGkEr1iNkTrQRNEI6j9dr4jbS/9pBzrh5l
         /TX+SMUnd0tuSMDef9n9OwdQhSLSuSArI21MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082141; x=1757686941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvUNphtUz9Y1R9ktHcB7KtYuXuG0QSWTDzZgUfzVFec=;
        b=wT0jh2XyCoh97qlvEUKmgpQa5UmTfqaelcJV0k/9vcs/7DPP4nrHT5D78jB4rSCjub
         y+AzfX/jgLJZj9+USL0GKjptgQddtmlc27+KfsiCiy8P0mrU327ryetVQQ0mese2VITV
         wvc6gZv0NaIbEM29fdhh8u2IGxlPoIe92xHAk/WY3asDvw4rJ7qV8MruDyhEwJBA3yrJ
         AU6FqvDpw2otj8e6LB5Nu98p6Lb/LrueejLQ27gxgipm2/69jJODps3OTssEPMbjJK99
         z+WGJ4HfOy1+sTAYkfwFuPW0M3ZwGpRwYvtvX9I83KvNTKFX6aoHEqxwNsNzBZ2tJ2tQ
         UqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5uYfZdGc+KCnQ1b7WuNG4ZdHk5XQ/oAkaf3KfQEpTAHzf3gL0c91SZibaz9U+xvaRM+AXP0dllx9isCFp7GU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvmzTzgzV7d3dP8DkOIbp0xnEuXl2f+XwB/SF7AE9JnjE9xsOm
	jXnfM5uXyxhV/AgroLJy3Z8YNfyscbV6Il8Frrgw+/1fzVQjrHvIrAH/Sh3MnJ3akA==
X-Gm-Gg: ASbGnct0IwJOmgT5e03M1zldAxTJC+FYGTIQOggYP39/ruL6bMLIESwQqUtxT0zjAOD
	E6Q1fF3Vk+mCNSRiTkKWnRYEpTRMDG1dKhX5EnUtmlwxqlkAvR78FAik6IO6bKf0bTEznRW5VMB
	zQ186+1xgqee1gMFwfi/2fQX+CE2n38/eyqVU+eobAs0xBLzFaONO3EVl/AI977wPG5HgR6eRNE
	YU434RsQNXRE4JwOCPD20IjMg8NW+8O6DpaSxMLPWr+tvNp0XBTH4wgN2qZ5O0aPcVtSjL9Tcez
	y9L8P8KpcovwXI+wlXNdpTKl8d4MJpaTsoYBnSDPgFIso59bfIysQB+fixGTuEvZreqTX2owOBm
	2V/wEyBTgQblCYnuLCFZQ/as/3pt4sgA4FFsyIH8HpjPezI4ZZZQ3oM0vHpI7NlwVKrajnRhblC
	W1nDVqMgFMdlNj4/uxIak4dQDxqw==
X-Google-Smtp-Source: AGHT+IGfW53wYhRJFchVhlBh0z4k+oPM9nbab+nSZ8hw1YR5eT88L0CvzsuEHVeF3Ys4E5J3K9DYPg==
X-Received: by 2002:a17:907:728e:b0:b04:7b7f:33be with SMTP id a640c23a62f3a-b047b7f352amr825270066b.48.1757082141093;
        Fri, 05 Sep 2025 07:22:21 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:20 -0700 (PDT)
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
Subject: [PATCH v3 4/5] usb: typec: Implement alternate mode priority handling
Date: Fri,  5 Sep 2025 14:22:05 +0000
Message-ID: <20250905142206.4105351-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
 drivers/usb/typec/Makefile         |  2 +-
 drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |  6 +++++
 include/linux/usb/typec_altmode.h  |  1 +
 4 files changed, 46 insertions(+), 1 deletion(-)
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
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..2179bf25f5d4
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include "mode_selection.h"
+#include "class.h"
+#include "bus.h"
+
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	struct typec_altmode **alt_target = (struct typec_altmode **)data;
+
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	int res = 1;
+
+	alt->priority = priority;
+
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..cbf5a37e6404
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_altmode.h>
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..571c6e00b54f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	unsigned int			priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.51.0.355.g5224444f11-goog

