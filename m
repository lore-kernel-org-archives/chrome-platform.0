Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49923064B3
	for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698578; cv=none; b=ELw/joU7H0FeK++f2MzWq2NxGOLW2FCEYGN1/4IA57B/CvuJJLAHij8TMo07Djfp8QChy9icGun/EWyFV20thFzIuZCaK4wtBveC2ZcyJoZHV0IF/NJNwPHWuUF5srajwwa8/JUCcp7ew82vuKF3zJ1KPNqOagQpZProBbvkbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698578; c=relaxed/simple;
	bh=Xle338lCram0KFdhSO6tsh8Djs8fMl2ZGO7ogQ7aDzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ru/ezfAqrXh4HsDY+IzRFZIVW8SCUJPaqD8Ditx70BURgIdzQf8MtThCHKQwNTmCLJdiQxayW0+183eqme6VAYr2CNyVDMIHaYPZpFeEncgiuFFiS1YMsZaLJSWHpRNCVY7ByzT8XwLbAfXQ1pjcvB/AZYnZCPIXkfR3ipTw7Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZB5YTLZl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J4N4i6QM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AdYgVerl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IVmmUdWT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZB5YTLZl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J4N4i6QM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AdYgVerl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IVmmUdWT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDEBD5BCCB;
	Thu, 29 Jan 2026 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769698575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ADkPVypQ4XreIDXNhapSh6XOVhp0PkHC8gfNh5W+GnM=;
	b=ZB5YTLZloszpTmVz9N2wHoeX3BsTAcBJPH0VNOIDLw25bs1YEHCJUS02erV7RYugK2cxzi
	6r6Sw8I+JJQjzEx1AuE96+dxy3CTJl7Xy4buY/4JjwncNYnsZlALHs7mzHH4wNWXtXn4St
	S08JKuE3mTguj6K8bl1HgjpbvF876+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769698575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ADkPVypQ4XreIDXNhapSh6XOVhp0PkHC8gfNh5W+GnM=;
	b=J4N4i6QM3zQLtw6ZfS0YYgP7Tn6FJqyCCvvRY0XBjBnWf4zok3JlQqp/udXtkOock4Rh7F
	krFBm7ifrYx6aRBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AdYgVerl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IVmmUdWT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769698574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ADkPVypQ4XreIDXNhapSh6XOVhp0PkHC8gfNh5W+GnM=;
	b=AdYgVerlhWib2VNp4z69FRToU2npgBO61100cawpOTrCKoddRDhiWglEW8LQZ2moDR7cLK
	Fb/hl9AXSwIVNup3aPPHgpkt3RxoJrGvWkKOaXJvbuMM35mkCdW8ScBzE5zrpD5iao3378
	u7N8wHYDmUhH9RV4AkNqh2GxJHKhet4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769698574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ADkPVypQ4XreIDXNhapSh6XOVhp0PkHC8gfNh5W+GnM=;
	b=IVmmUdWTJ13LwZH8tD+Lo4PJ8CXH0kJrJbkFVqkKNP6Rh3sfdmCfDMp1B0BTFGlSkawWkC
	Qiu3HpeLRRYr5iAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DC443EA61;
	Thu, 29 Jan 2026 14:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CuVQJQ51e2nQDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jan 2026 14:56:14 +0000
Message-ID: <3ff5456f-b925-410d-a671-070eec85484b@suse.de>
Date: Thu, 29 Jan 2026 15:56:14 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-12-tzimmermann@suse.de> <aXhuENnpeevg7vpw@google.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <aXhuENnpeevg7vpw@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EDEBD5BCCB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi

Am 27.01.26 um 08:49 schrieb Tzung-Bi Shih:
> On Thu, Jan 15, 2026 at 08:57:21AM +0100, Thomas Zimmermann wrote:
>> Add corebotdrm, a DRM driver for coreboot framebuffers. The driver
>             ^ oo
>
>> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
>> index 514c95f9d0e3..e81ee5746e2b 100644
>> --- a/include/linux/coreboot.h
>> +++ b/include/linux/coreboot.h
>> @@ -14,6 +14,7 @@
>>   
>>   #include <linux/compiler_attributes.h>
>>   #include <linux/types.h>
>> +#include <linux/stddef.h>
>>   
>>   /* List of coreboot entry structures that is used */
>>   
>> @@ -64,4 +65,7 @@ struct lb_framebuffer {
>>   	u8  reserved_mask_size;
>>   } __packed;
>>   
>> +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
>> +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
>> +
> Does LFB stand for "Linear Frame Buffer"?

Yes.

>
> I supposed the LFB follows the struct lb_framebuffer in memory.  If yes, I'm
> wondering does LB_FRAMEBUFFER_HAS_LFB() work?  As the struct lb_framebuffer
> definition is different from [1].
>
> `offsetofend(struct lb_framebuffer, reserved_mask_size)` is 37 in the kernel
> but the tailing data (i.e., LFB in the context) might start from offset 40 in
> coreboot.

Newer versions of coreboot add fields to the end of struct 
cb_framebuffer. So it keeps growing in size.

This macro checks is the provided size is large enough to cover 
framebuffer information. The framebuffer info consists of all the fields 
up-to-and-including reserved_mask_size. Testing with 
LB_FRAMEBUFFER_HAS_LFB is a safety measure, as we can assume that it's 
always there.

If coreboot provides less fields, it is likely broken. If it provides 
more fields, it doesn't affect the framebuffer.

Best regards
Thomas

>
> [1] https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L232

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


