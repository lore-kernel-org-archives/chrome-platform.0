Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF4239594
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548634; cv=none; b=NDO1FdXYjfO8Y6o1iK6fPafKM0ctMSVB4ZVl4hxRI7pnnpEqMxU1BaDCgIW6oeVqsw8QPcPuJUGYh2CaRazHRlOKV0CUyOkrAJrHgaa61HUpFbqhLpH/44Ux4Zl6ub7OGAYYr5sju2YxW8bY4oy7EOzyMI1tHDH4Vagx4eYG2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548634; c=relaxed/simple;
	bh=jkSP44Kjvo4z0bYEcvmEfQm7oc5R+8SUwMh8BWdWteU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbOJz9LTIE+4rbhX9aRTT2ZnCl5eVdYeysUJ33o9MsRMUIfXMeBGIvEv0QVFXb/+CjLiP43HGfyqbE0aiuIgeUGIMvHWoiTmxTTsdS9d+N6bX8XPS7xiIjprm2KLw0vBGllFOARlLYTzYO4iX95K9zGQEBa4WjVTIhXHRjm5Afc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysSXB+uI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xC71ZXC0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysSXB+uI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xC71ZXC0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysSXB+uI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xC71ZXC0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysSXB+uI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xC71ZXC0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7798E3368D;
	Fri, 16 Jan 2026 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768548629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gGmnBqFeo99Z7pjmTLspM4xJB3J3GNXos4QudhNmInE=;
	b=ysSXB+uIXUNvoaV/15pmHk0kYCl+v3zFlmFXT3n47CcnpYASviit8nEPRLXSmmEJMWehia
	SsWsxdM7tgSZR0giwUplMYy7IXRpfK9poATroIgZNC1+HKv2TqOE9i7fobV7/bKor6fT4C
	DpcVs0Yfy0yCmbkP0wWkfOOjZlHucrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768548629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gGmnBqFeo99Z7pjmTLspM4xJB3J3GNXos4QudhNmInE=;
	b=xC71ZXC0ViXDCFL4BUeM5ezhEvQw+2KOyJqqMiXpntrFmY/m9osmkV7Dx/X7KRt6rI5/eZ
	1n53sX67ZoW5QWDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ysSXB+uI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xC71ZXC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768548629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gGmnBqFeo99Z7pjmTLspM4xJB3J3GNXos4QudhNmInE=;
	b=ysSXB+uIXUNvoaV/15pmHk0kYCl+v3zFlmFXT3n47CcnpYASviit8nEPRLXSmmEJMWehia
	SsWsxdM7tgSZR0giwUplMYy7IXRpfK9poATroIgZNC1+HKv2TqOE9i7fobV7/bKor6fT4C
	DpcVs0Yfy0yCmbkP0wWkfOOjZlHucrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768548629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gGmnBqFeo99Z7pjmTLspM4xJB3J3GNXos4QudhNmInE=;
	b=xC71ZXC0ViXDCFL4BUeM5ezhEvQw+2KOyJqqMiXpntrFmY/m9osmkV7Dx/X7KRt6rI5/eZ
	1n53sX67ZoW5QWDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2165C3EA63;
	Fri, 16 Jan 2026 07:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YzTxBhTpaWmSSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 16 Jan 2026 07:30:28 +0000
Message-ID: <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
Date: Fri, 16 Jan 2026 08:30:27 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
To: Julius Werner <jwerner@chromium.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-6-tzimmermann@suse.de>
 <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com>
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
In-Reply-To: <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7798E3368D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi

Am 15.01.26 um 21:54 schrieb Julius Werner:
> Not really sure I understand this part? The code in coreboot_table.c
> creates the device that represents the entry in the table. The code in
> framebuffer-coreboot.c (which this Kconfig guards) contains the code
> that creates the device which will be the actual framebuffer. Doesn't
> it make sense for that part to depend on a framebuffer backend being
> available?

Corebootdrm already depends on the CONFIG_GOOGLE_FRAMEBUFFER, which is 
standard behavior for all kernel drivers (i.e., drivers depending on 
architectural options). Having dependencies in the other direction 
creates a circular dependency, which Kconfig doesn't handle. But 
generally speaking, what's the point of having that framebuffer backend 
code then? I tried to remove it, but it is supposed to remain. But it 
would not serve a purpose other than creating the platform device for 
the actual driver. I'm confused about the reason for this design.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


