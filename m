Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5312132C75
	for <chrome-platform@lists.linux.dev>; Thu,  7 Dec 2023 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHjDctJH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1d03cf821e3so4822355ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 07 Dec 2023 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940089; x=1702544889; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=znqUQgbDyGs2yHI5XAyPSDU3w/SigHyVPnlMFTmu+CA=;
        b=JHjDctJHcIBOERk31sE5ENGlwRtBR/9HCzM1f0FlNgKYecmXdz9BiCo3JlbpsAfh9O
         OFkFuGRaj68ftCvaV7tet8XL8FXJyp49d65N5k3AUi06RrYXNqF8Gzb26iY6AHUQcEMK
         fhoODrbHAs4nOKA4WS1WSEeWBKJp0306fQEgqr6O5XXdKpq71E2nHYe9F2MDevLKPf1o
         cuDbCg86b1LH+NbHdU29MkmEcUhQZ7nQon4R2P21PIIL+f/VEmX6ImuzAhgsD+S3i5a6
         xw1js4TXl9VfPcL9aJ4VFdBbZdQHKVrWuCE09YLRDsMnOBv/JVv3ikQJMQlB+yATgYeS
         vEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940089; x=1702544889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znqUQgbDyGs2yHI5XAyPSDU3w/SigHyVPnlMFTmu+CA=;
        b=E1j8vz6a7gZiirdp3y5QoXfEiqA6Q18uaQ9sCcwI/cuWX5nyguxh5c39FPDtoNPjE1
         u9O1ul8XHyGay7TMP0feuv/PSVo/ihmDFlkFcaMNMVllW4GBsZZwFVyFCTHjvdeOS9I3
         jH9H8JYbgYT/CrSsqX+jSEKtcKXlSzj/cIQaqw66QeW0h/EHHY8cyjwIuHsAwpzM1O4h
         74/RCwqcBheujWcdA6FUupO6VSd2vZHMALhN2ZBjkzcR1CaLRG3pbWsVwmo/n4QwOiyw
         aMx9INWPGYcRxV2/DSV4bjFJd3OzvFX0mVEOycoEBqAiNXhrMVneB56QgWNKW6JOAEsR
         eSdQ==
X-Gm-Message-State: AOJu0YydDE2e9wnw/NMxoPtjaB+M+mSJcKmF6A1Z0zyMPYtM0EisTlwH
	YpzGlNNxPtN9j83LSS8zbJgKk8WZQtIcHxs=
X-Google-Smtp-Source: AGHT+IGCK+2bl6ADzAUM/jG97tfMH17DmF8B9kJMt9q3pqUQJxliqtVIlm8QzihmYwo4Y16lhk33Af1c+GFCI9o=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:903:492:b0:1d0:559e:4130 with SMTP
 id jj18-20020a170903049200b001d0559e4130mr23446plb.9.1701940089680; Thu, 07
 Dec 2023 01:08:09 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:38 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4417; i=rdbabiera@google.com;
 h=from:subject; bh=PMhwKTq+HFv3EMRYrPK9u2LnZd//sBDn+vc2LOClaUo=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3bFSVneLzI5w/F5jtvleR0/HhXd/7m40O3OyOvvbH
 a43r9xkO0pZGMQ4GGTFFFl0/fMMblxJ3TKHs8YYZg4rE8gQBi5OAZjIQ1GG/x77D66fkBGqsOMZ
 63TjLZfeR4fKzFu9WEfbq4rho/Ol8oOMDCtWBO74vLbnfM0uX6/Eh6xrgr9M+nrqRtdOm3OT3tz tbuUDAA==
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-19-rdbabiera@google.com>
Subject: [PATCH v1 07/10] usb: typec: tcpm: add state machine support for SRC_VDM_IDENTITY_REQUEST
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add SRC_VDM_IDENTITY_REQUEST state which first enters after SRC_STARTUP.
The state sends Discover Identity on SOP' and transitions to
SRC_SEND_CAPABILITIES. SRC_SEND_CAPABILITIES will transition back into
SRC_VDM_IDENTITY_REQUEST instead of retrying immediately.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2b650b419421..f55bcbe6f031 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -146,7 +146,9 @@
 	S(PORT_RESET_WAIT_OFF),			\
 						\
 	S(AMS_START),				\
-	S(CHUNK_NOT_SUPP)
+	S(CHUNK_NOT_SUPP),			\
+						\
+	S(SRC_VDM_IDENTITY_REQUEST)
 
 #define FOREACH_AMS(S)				\
 	S(NONE_AMS),				\
@@ -1989,6 +1991,14 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				 * the svdm_version for the cable moving forward.
 				 */
 				svdm_consume_identity_sop_prime(port, p, cnt);
+				/*
+				 * If received before explicit contract, continue
+				 * to SRC_SEND_CAPABILITIES
+				 */
+				if (port->state == SRC_VDM_IDENTITY_REQUEST) {
+					tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
+					return 0;
+				}
 				*response_tx_sop_type = TCPC_TX_SOP;
 				response[0] = VDO(USB_SID_PD, 1,
 						  typec_get_negotiated_svdm_version(typec),
@@ -2283,7 +2293,8 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 * if there's traffic or we're not in PDO ready state don't send
 		 * a VDM.
 		 */
-		if (port->state != SRC_READY && port->state != SNK_READY) {
+		if (port->state != SRC_READY && port->state != SNK_READY &&
+		    port->state != SRC_VDM_IDENTITY_REQUEST) {
 			port->vdm_sm_running = false;
 			break;
 		}
@@ -2359,13 +2370,22 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			tcpm_ams_finish(port);
 		break;
 	case VDM_STATE_ERR_SEND:
+		/*
+		 * When sending Discover Identity to SOP' before establishing an
+		 * explicit contract, do not retry. Instead, weave sending
+		 * Source_Capabilities over SOP and Discover Identity over SOP'.
+		 */
+		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
+			tcpm_ams_finish(port);
+			port->vdm_state = VDM_STATE_DONE;
+			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 		/*
 		 * A partner which does not support USB PD will not reply,
 		 * so this is not a fatal error. At the same time, some
 		 * devices may not return GoodCRC under some circumstances,
 		 * so we need to retry.
 		 */
-		if (port->vdm_retries < 3) {
+		} else if (port->vdm_retries < 3) {
 			tcpm_log(port, "VDM Tx error, retry");
 			port->vdm_retries++;
 			port->vdm_state = VDM_STATE_READY;
@@ -4483,8 +4503,12 @@ static void run_state_machine(struct tcpm_port *port)
 		}
 		ret = tcpm_pd_send_source_caps(port);
 		if (ret < 0) {
-			tcpm_set_state(port, SRC_SEND_CAPABILITIES,
-				       PD_T_SEND_SOURCE_CAP);
+			if (tcpm_can_communicate_sop_prime(port) &&
+			    IS_ERR_OR_NULL(port->cable))
+				tcpm_set_state(port, SRC_VDM_IDENTITY_REQUEST, 0);
+			else
+				tcpm_set_state(port, SRC_SEND_CAPABILITIES,
+					       PD_T_SEND_SOURCE_CAP);
 		} else {
 			/*
 			 * Per standard, we should clear the reset counter here.
@@ -5399,6 +5423,13 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP, TCPC_TX_SOP);
 		tcpm_set_state(port, port->pwr_role == TYPEC_SOURCE ? SRC_READY : SNK_READY, 0);
 		break;
+	/* Cable states */
+	case SRC_VDM_IDENTITY_REQUEST:
+		port->send_discover_prime = true;
+		port->tx_sop_type = TCPC_TX_SOP_PRIME;
+		mod_send_discover_delayed_work(port, 0);
+		port->upcoming_state = SRC_SEND_CAPABILITIES;
+		break;
 	default:
 		WARN(1, "Unexpected port state %d\n", port->state);
 		break;
@@ -6123,7 +6154,8 @@ static void tcpm_send_discover_work(struct kthread_work *work)
 	}
 
 	/* Retry if the port is not idle */
-	if ((port->state != SRC_READY && port->state != SNK_READY) || port->vdm_sm_running) {
+	if ((port->state != SRC_READY && port->state != SNK_READY &&
+	     port->state != SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_running) {
 		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
 		goto unlock;
 	}
-- 
2.43.0.rc2.451.g8631bc7472-goog

