Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508484;
	b=LfcksvX3AW5hCE3Ha1nQFVsBzhB+ovwtR/O03FfJ6rvAXeLZ+uf0KYVfwRr0qVyNVMk8
	 NoNP9ZYPXmlpz9e3CtDiNAdHeZjOhPg8Egx3ICF+W9KHALOiLuHcNvIQWxlBQPn8qeUuD
	 Kc3yiJdy0daEOr4lHnCWuljnDG5BJDIdJcKwO+DjMI0AWgJHrbkkGrjHysq6ums65pm/6
	 onnAsmi+TtgKvMLSqIEcxwbVKpXoJibkIBX1esL5LXz6lIX7w87hHGetyXwAEOpw5Z/1m
	 z68sfAT2+OdEKXF+wrCsrMq5XayEJvOFfnFWQm2GuM2xGfDOld0M/Ny/RnMJEe5/AlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508484;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pbi++UG35qV7Nm5IIjZEnBZcP22OgKG1DiXlcajoGsc=;
	b=GAfUbNf4v9gDF0NZjFaxP9YZ6TWkIU3nn8B/UadK/YqGYPUVqg4haK6oJEJPGE7UXA6r
	 W9nebs783S4RIvpYpdYe9p9+ILXL9QeUlQZlpyBsLW9DH2k/ZdjSNnRGnQkW2MQocyZcA
	 iai6nPDqZ+qrmj8JkeLYQneWdApclgOiHP9qk13+YjQqpKzRi3pwRU65eJ7wGf1lIIKQ4
	 jdGEshxjQY9cmRHrffqQV2f4iB6zmwBQnton4tgwM3iIXlR8wOsY1ldEllZGDuPeUKu1+
	 4wgeVJwOjnmj97vHspOZ7ujXhutzb0SDNdkRnIJKaFFi8XbHvIfSNhHrkIJIK/ll6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biTkjR6m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C1606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biTkjR6m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B1B1F000C4;
	Tue, 24 Nov 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508484;
	bh=pbi++UG35qV7Nm5IIjZEnBZcP22OgKG1DiXlcajoGsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=biTkjR6mADOkKBNe5a4Bot0wGF3ct7a8oR754XMZMq693z2LfmBdyi74N3RSSGaUC
	 RSsFIn6hzxVxaixyZYrX2y6xGYIOMWC840DEJjcx0o28tUayiwi2pLzlpHC7+lFeCm
	 JuAhuedrZIX1otBJghjnDL7zBqkxa1sLQaqrwbkeJ2BCdBAQYFdLTn30cCV78XccFn
	 o6oIBDRiuuPbNTPNmWdXCrinY4G7nowCCZlmFMbB46V5511Y0RWSq3MZQwIc/bC+i0
	 eZg/yv4Hn3NcSPtxI0WSF1kTNq9p5cWJ6W1RmwTL0H8y7ckX6pKgth5CBHwOjsTIl5
	 jfBekQx31SCUg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/9] platform/chrome: cros_ec_proto: Reset msg->result before sending command
Date: Tue, 24 Nov 2026 08:21:04 +0000
Message-ID: <20261124082112.3361229-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261124082112.3361229-1-tzungbi@kernel.org>
References: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`msg->result` could be uninitialized or stale.  Reset it before sending
a command.  Otherwise, if the transfer fails before updating
`msg->result`, cros_ec_send_command() may spuriously enter
cros_ec_wait_until_complete() when `msg->result` happens to be
EC_RES_IN_PROGRESS.

Fixes: d86c21fd3111 ("mfd: cros_ec: wait for completion of commands that return IN_PROGRESS")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index b81b37c7169a..0306bedd0f0f 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -116,6 +116,8 @@ static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 	int ret;
 	int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
 
+	msg->result = EC_RES_SUCCESS;
+
 	if (ec_dev->proto_version > 2)
 		xfer_fxn = ec_dev->pkt_xfer;
 	else
-- 
2.56.1.831.g720f3f5937-goog

