Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FD14C5AE
	for <chrome-platform@lists.linux.dev>; Tue,  4 Jun 2024 23:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542480; cv=none; b=haw7aOrFi9rwqkbzPcgiyCs/FhlltcrhnPISTsPIrdfn3we4CL+jbtC9iLsR9DGjr/fznlMmqyX399SJBu9MdKfNXbDMGyg5M1XmrlT6qHQ1V8Xbg10S561+sdy/E3+r+QqMadzHX326q63BT4ERe5HZGuV6Vlb5qVLlOT5LtMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542480; c=relaxed/simple;
	bh=S+9zz71oaA3sB9uTHupPRjwzN/Kg3Zov6NucuxB+qjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6fdzDd9qf15Bzo1IluAKb2EIIR166Do0e9XXA3vPca43DsB3P3M/ivMHb3pshyL+D3kQ8uxGnXLS+o8599jDqmV06p5I21UUmouEwoKQanFofoH8cbLZ582pslOKTxBaHgkCIT5ivSvk67J4gYyvU2MyL0dcwHYhHoDDRD2afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GLS1feQa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GLS1feQa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f63642ab8aso37899495ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 04 Jun 2024 16:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717542477; x=1718147277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80AADrANMPKTbjfSl+glHpJQtK8BahTa2d2kuE5FSZM=;
        b=GLS1feQaYawdug6PYBOe5qzgBXEXjW7OhBHlU6lJXc9UkeTezC8mr0Lh0qW+g1WYVr
         UpnRKjK/JL8nsUOzNpzpSGgUeFzhPEmglga/nC/fhrsniLf3AuHS31mzRJalXXExERHK
         9y4tl+0GkCT+jS9ZAstbwR0pdI/Zm5zxo2oxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717542477; x=1718147277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80AADrANMPKTbjfSl+glHpJQtK8BahTa2d2kuE5FSZM=;
        b=X7pZoxJe5nb81NtKyniYIIhKfMJpusnJ24UtQplHIVJeJjFurccoVKF2r3mkZ9m/vZ
         XMD4jiy9VD3GiyHV8jsjN2hVPHFcN2k8IGVGnTmXFS4mKq+NrnyvmvPMlLh6h/HF5wfr
         I5HGoanWaSyFUH7qkdjUSHhyWsMNtBsBshxOPmi6MlPX1bH551CbQ91W7hTWVCF1eZZs
         Y/q7OfTKxsf9cRqsB0wvQ24uHkvZjIe+x/lBmFY+A3Of8QWufMtqCuVuSfPkdaoXql8E
         xDwt72dgVH8kdaFBj03CD36hsDf+HCV2EsZoToTwVV5cZyP+MFaDY5BxCNCV6Ecgzw44
         FYIg==
X-Forwarded-Encrypted: i=1; AJvYcCW/a1fa/tIhQmfZCunVqQ5lDYLKys9UTTgk5Fn1VGkS0iGy5QcFOlrMyh5vnQs/VIbsVV+q76eyn2OXS1j79BS3xnUVlqcqrG9g8/ZITwB8
X-Gm-Message-State: AOJu0YyKFqWc0//TL5Dn2tELoSPjmIjoyseJQS6xYGF4YVeWH6J/mMql
	KAx9ZReRG/KoJBtiIYJCzSGAdB3kAm9974DsWs6WHzFP+BfO3MtR8W13VssNCQ==
X-Google-Smtp-Source: AGHT+IESK5FVg7WsCAIz1cS7J9B0Nn73/Zd4nIJdxwYoZbUDUI7xTGlZe6xJjA3kgjPYsmniqjhxQw==
X-Received: by 2002:a17:902:dac9:b0:1f6:1c72:955f with SMTP id d9443c01a7336-1f6a5a5ca77mr11660895ad.43.1717542476907;
        Tue, 04 Jun 2024 16:07:56 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:c108:1a83:e639:e62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd60sm88556845ad.38.2024.06.04.16.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:07:56 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/chrome: Add struct ec_response_get_next_event_v3
Date: Tue,  4 Jun 2024 16:07:29 -0700
Message-ID: <20240604230742.2878452-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240604005354.2294468-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct ec_response_get_next_event_v3 to upgrade
EC_CMD_GET_NEXT_EVENT to version 3.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
Change-Id: I69ac374fd88c3d3ef294f8e81443a2fea588bbce
---
 .../linux/platform_data/cros_ec_commands.h    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 070e49c5381e..fff191a8d413 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3527,6 +3527,34 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
 };
 BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
 
+union __ec_align_offset1 ec_response_get_next_data_v3 {
+	uint8_t key_matrix[18];
+
+	/* Unaligned */
+	uint32_t host_event;
+	uint64_t host_event64;
+
+	struct __ec_todo_unpacked {
+		/* For aligning the fifo_info */
+		uint8_t reserved[3];
+		struct ec_response_motion_sense_fifo_info info;
+	} sensor_fifo;
+
+	uint32_t buttons;
+
+	uint32_t switches;
+
+	uint32_t fp_events;
+
+	uint32_t sysrq;
+
+	/* CEC events from enum mkbp_cec_event */
+	uint32_t cec_events;
+
+	uint8_t cec_message[16];
+};
+BUILD_ASSERT(sizeof(union ec_response_get_next_data_v3) == 18);
+
 struct ec_response_get_next_event {
 	uint8_t event_type;
 	/* Followed by event data if any */
@@ -3539,6 +3567,12 @@ struct ec_response_get_next_event_v1 {
 	union ec_response_get_next_data_v1 data;
 } __ec_align1;
 
+struct ec_response_get_next_event_v3 {
+	uint8_t event_type;
+	/* Followed by event data if any */
+	union ec_response_get_next_data_v3 data;
+} __ec_align1;
+
 /* Bit indices for buttons and switches.*/
 /* Buttons */
 #define EC_MKBP_POWER_BUTTON	0
-- 
2.45.1.288.g0e0cd299f1-goog

