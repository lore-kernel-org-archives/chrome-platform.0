Received: from smtp2.tecnico.ulisboa.pt (smtp2.tecnico.ulisboa.pt [193.136.128.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1343D1CB0
	for <chrome-platform@lists.linux.dev>; Mon,  9 Mar 2026 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070339; cv=none; b=fYTf2qFt0mkYfkHWqBsZAYoqFeYG4+U8qgmPe6FJ0AStHJADSoPbgneLjC1uqqb//wN6s37YsQrcPTdLTI1tBfmXl9R5mu9y6qniF18kzWtMDcrmrenokCjTtMVa9QW6LH5xxfw5z7z/VGJHkb1ovAHw9XczNw6Ve4RAG1XP9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070339; c=relaxed/simple;
	bh=DgCo5b+t8jNCnYz0nQONYvqtZwerOrR/Qi5Bp7phMLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am/gRZ7rQPDAcPGm5EZuyztChFDsEvU/zorbth7mTGVlfHciuPbrR2WdWUI935nrfObEF0rUS7THZZBOrsQYhiGlBa1c+e6u9z9pfZioaHvYzQrQ6UbYm0+7axjTzVYSj7tdFSpJDo2joK1Cq7JyoS6WoynxTtmqwbq6SCTR5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=qVXuYum+; arc=none smtp.client-ip=193.136.128.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="qVXuYum+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTP id 3BEC92453EE;
	Mon,  9 Mar 2026 15:25:05 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp2.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp2.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 5TpKuxMcGeYE; Mon,  9 Mar 2026 15:25:02 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6DB3E2453F2;
	Mon,  9 Mar 2026 15:25:02 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1773069902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXUVgIbyiMmhG5POOJKCLgZvPCzanCBSxp9dSzLRDM4=;
	b=qVXuYum+NtXN+OYxW95UUqr/6bmH9j4npukIwpuvOuziGA0UvwsC7ZZt79gyILb5q2r5yI
	Y+oVMURhVABFjJMzxPdD2m84BqSr5SUW6EER1C7YJEkLFGqckmTXAptVqoxmlURuRuultv
	28uRq1Y2AhEwVR/k6AY46e7VVpxR6+OhGfQ2sRlvi5q5Xys7baxS2uEMPs4D0PXtWF9Q4/
	VlEuR76Mz76AhNeg0Wfp3q+HBp/N4TSQR2wNisHRDaRcBuJNs7UOfEymgsnk8ReGxmb3LP
	xCr+NrXQL40aoRuBiFieWD+22vX/XsAWUhURpdZMy6Ej35szqvBH/OeZ5137Pg==
Received: from [192.168.2.116] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A2738360235;
	Mon,  9 Mar 2026 15:25:01 +0000 (WET)
Message-ID: <c41aa917-5fca-488a-aa33-4c780544f43d@tecnico.ulisboa.pt>
Date: Mon, 9 Mar 2026 15:25:01 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
 <CAMMMRMf_Se9fbH50RSJvEfHCF6ds6TZfVzK4NJCs2UsViGAr1A@mail.gmail.com>
 <cef799c2-1612-4e28-bae5-ab33cd9c3aa8@tecnico.ulisboa.pt>
 <CAMMMRMe0Od7jJ+nJdRn_P+gU-8aaFd4K-g-UKz2j43wNiqE-MA@mail.gmail.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <CAMMMRMe0Od7jJ+nJdRn_P+gU-8aaFd4K-g-UKz2j43wNiqE-MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/4/26 10:30, Andrei Kuchynski wrote:
> On Tue, Mar 3, 2026 at 10:54 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>>
>> Hi Andrei, thanks for testing.
>>
>> On 3/3/26 07:17, Andrei Kuchynski wrote:
>>> Hi Diogo,
>>>
>>> On Thu, Feb 5, 2026 at 11:04 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>>>>
>>>> Currently the code assumes that the EC firmware will leave Type-C mux
>>>> handling logic to the AP, exposing an interface to query and change the
>>>> mux state via a request from the AP. However, in devices such as Smaug
>>>> the EC automatically takes care of mux configuration and only USB role
>>>> switching needs to be handled by the AP. In fact, in such devices this
>>>> interface is not exposed by the EC making the whole process fail,
>>>> including role switching.
>>>>
>>>> Fix this by first separating Type-C mux handling and USB role switching,
>>>> explicitly querying the behaviour of the EC and execute each part
>>>> conditionally according to what the EC reported.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>>> ---
>>>>    drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++----------
>>>>    drivers/platform/chrome/cros_ec_typec.h |  2 +-
>>>>    2 files changed, 35 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
>>>> index b712bcff6fb2..bd7e6c365cab 100644
>>>> --- a/drivers/platform/chrome/cros_ec_typec.c
>>>> +++ b/drivers/platform/chrome/cros_ec_typec.c
>>>> @@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>>>>           }
>>>>
>>>>           /* No change needs to be made, let's exit early. */
>>>> -       if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
>>>> +       if (port->mux_flags == resp.flags)
>>>>                   return 0;
>>>>
>>>>           port->mux_flags = resp.flags;
>>>> -       port->role = pd_ctrl->role;
>>>>
>>>>           if (port->mux_flags == USB_PD_MUX_NONE) {
>>>>                   ret = cros_typec_usb_disconnect_state(port);
>>>> @@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>>>>           if (ret)
>>>>                   return ret;
>>>>
>>>> -       ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw,
>>>> -                                       pd_ctrl->role & PD_CTRL_RESP_ROLE_DATA
>>>> -                                       ? USB_ROLE_HOST : USB_ROLE_DEVICE);
>>>> -       if (ret)
>>>> -               return ret;
>>>> -
>>>>           if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
>>>>                   ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
>>>>           } else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
>>>> @@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>>>>           return ret;
>>>>    }
>>>>
>>>> +static int cros_typec_set_role(struct cros_typec_data *typec, int port_num,
>>>> +                              struct ec_response_usb_pd_control_v1 *resp)
>>>> +{
>>>> +       enum usb_role cur_role = usb_role_switch_get_role(typec->ports[port_num]->role_sw);
>>>> +       enum usb_role role = resp->role & PD_CTRL_RESP_ROLE_DATA ? USB_ROLE_HOST :
>>>> +                                                                  USB_ROLE_DEVICE;
>>>> +       bool connected = resp->enabled & PD_CTRL_RESP_ENABLED_CONNECTED;
>>>> +       int ret;
>>>> +
>>>> +       if (!connected || cur_role == role)
>>>> +               return 0;
>>>> +
>>>> +       ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw, role);
>>>> +       if (ret)
>>>> +               dev_err(typec->dev, "Failed USB role switch, err = %d\n", ret);
>>>
>>> While testing on Brya, I've got a role switch failure:
>>> cros-ec-typec GOOG0014:00: Failed USB role switch, err = -22
>>> cros-ec-typec GOOG0014:00: Update failed for port: 1
>>>
>>> Steps to reproduce: deactivate any alt-mode.
>>
>> I'm unsure of what you mean by this, could you clarify?
>>
> 
> The cros_ec_typec driver supports DisplayPort and Thunderbolt alternate
> modes. During altmode activation or deactivation, the driver handles
> Embedded Controller (EC) events via the cros_typec_port_update.
> 
> The `active` sysfs attribute is used to initiate these processes; writing 0
> to `active` will exit DP or TBT alternate mode.

Thank you for the clarification. In any case err = -22 seems odd when the
call to usb_role_switch_set_role() is not receiving any parameters that
are obviously wrong. What is the underlying usb_role_switch
implementation in your platform?

Thanks,
Diogo
> 
> Thanks,
> Andrei
