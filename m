Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3916B239E7D
	for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690500; cv=none; b=YLOtFttzUsaSHceF22qi+69gUHZGA2TldoTTOesVxPYTRqMBJDMqV1XU2xODX1NJo1jHpz2ANMJJvWxr5ADQh7AiXk73jd7b1Yc7i0rsKCIYF94Z948U1daD2qPNC0IDDLupfE59nntTxFiuwGMUtPBBcWq+jhLxGxYs9qevhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690500; c=relaxed/simple;
	bh=3bHzGbD66B88JCvXGoSXLypYyBfOMcVaUbqBxDgtpwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEAiGVBzEUPFgPPDl7fimVzbV1lnKTzMleQj7rADvmeEdpKWHEf979YmNf2JHUTZrO0zV0P2Dg6XEybQvXatRNs/PtO/VkHqqkAc8PmQjecP3BqEH8NjdfGgznbZKa4WtCmC8RCMEHy8tchYIts9jh/iYBHz2JrfP5pJqf1lp08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XgURDsR8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2g5FVlRN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RQ63o+9Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PzFdR25W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XgURDsR8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2g5FVlRN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RQ63o+9Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzFdR25W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D7435BCE6;
	Thu, 29 Jan 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769690497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZhLBjr9NONwdfK2/efN92blRXVmRq2Ai5ZNRUh6Zzc=;
	b=XgURDsR84kR8CSvVKgIWfO9RtwGTytWwnKZ6fLyY1Oq8BN5K8uKpbsAeSjw9sZyXr8GfFb
	4MQ8uLCCHgBW/vW/5VLsk40TvRofpoCc1xDuWap4ZNgdsgrh4Ip+m1YkKQplEVGcTjCpV3
	owVchWcBAQIu2tF2DJgkTQekmDTulXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769690497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZhLBjr9NONwdfK2/efN92blRXVmRq2Ai5ZNRUh6Zzc=;
	b=2g5FVlRNJEO1PgCffe8IiVQ/o8osi4tq1CImok/As/Sw9FDWu+rtyMJjzf9jdJFRW4uSzT
	sIkRcJTsDwALwzDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769690496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZhLBjr9NONwdfK2/efN92blRXVmRq2Ai5ZNRUh6Zzc=;
	b=RQ63o+9YO1XD5R4vKBdwEBP0RN4JUZJP/eZqcp+eaIjzIsVFjFppaAH5ZKFeKbIKKMOY3p
	RsbD1nKOqmOznhfPzLtTO/iGGySy9iDTXyQVHrXL2PEXrRR4usaSL3Ki7zam6KwJgHw0eN
	+uolSlPcWxSo5QS5A/nuXaC4VeDH8tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769690496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZhLBjr9NONwdfK2/efN92blRXVmRq2Ai5ZNRUh6Zzc=;
	b=PzFdR25WYVwio0OOOzYuY6L2bcRFHwyoH7KPjCqJrHIIBjS0fFSeQqkxxNMrBF5Eh3FU4W
	XEZ4YL4Es/LJFoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3ABC3EA61;
	Thu, 29 Jan 2026 12:41:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VwA9Ln9Ve2nWbQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jan 2026 12:41:35 +0000
Message-ID: <bc053bb6-f2b9-48ee-bd5a-acc962c19df6@suse.de>
Date: Thu, 29 Jan 2026 13:41:35 +0100
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
 <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
 <CAODwPW-8MP2Ps8J6DV7K3CeTMGC_HFyb32P3Tj6__nZ5w3nxCQ@mail.gmail.com>
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
In-Reply-To: <CAODwPW-8MP2Ps8J6DV7K3CeTMGC_HFyb32P3Tj6__nZ5w3nxCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hi

Am 17.01.26 um 02:38 schrieb Julius Werner:
>> Corebootdrm already depends on the CONFIG_GOOGLE_FRAMEBUFFER, which is
>> standard behavior for all kernel drivers (i.e., drivers depending on
>> architectural options). Having dependencies in the other direction
>> creates a circular dependency, which Kconfig doesn't handle.
> Yes, okay, I think that makes sense. I thought `DRM_SIMPLEDRM` was
> some sort of more general option that the DRM subsystem is enabled,
> but I guess it was just the driver that you now replaced with
> DRM_COREBOOTDRM, and I understand that you can't have a circular
> dependency there.
>
>> But
>> generally speaking, what's the point of having that framebuffer backend
>> code then? I tried to remove it, but it is supposed to remain. But it
>> would not serve a purpose other than creating the platform device for
>> the actual driver. I'm confused about the reason for this design.
> I thought the point was just to have a place to put that `if
> (sysfs_handles_screen_info()) return -ENODEV;`? (That and that PCI
> parent device thing you're doing where I don't really understand the
> code enough to know what it's for.)
>
> If you can put that line directly in corebootdrm_probe() instead (and
> bind it directly to the coreboot bus device), then that's perfectly
> fine by me too, and then you can get rid of framebuffer-coreboot.c. I
> just assumed that there was some reason I don't have the expertise to
> understand for why you couldn't do that.
>
> My earlier concern here was just about not putting that line into
> coreboot_table_populate(), because then you would be preventing the
> creation of the sysfs node for that coreboot table entry, while all
> other entries that don't have associated drivers are still there (and
> that seems inconsistent).

Makes sense. Then let's leave the logic as it is.

Best regards
Thomas



-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


