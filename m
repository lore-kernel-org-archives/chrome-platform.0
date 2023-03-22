Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05DBA53
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 23:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679528414; x=1711064414;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYWRoLzMsDk=;
  b=fKY/EOGuIBCWEUwOiMcEDv3+DVSLFqlnGQskhHFj3D1BpmT4qBJIyJOJ
   jpqy55ivzW8R3dyD6/tCJvEdp6dyyV5pjm2Z3FJlkjjpnJLY29G4GN26I
   Y8pyNhRdrnBnFgUAjyqDm4VzoxgnIl4uXko+T1DUfIoF6+FLRBTFK0r8s
   awt4oInnB6VcAKXbocU36EAgjKypwUhVmVvWkkJy38ptknXU4TMy6+7LF
   qiJQa+6U07YSBpVS2lMFvVkAowkJ0K5Kk8taU1YcDIMouQNGOAdBqczm5
   tUNajsyXTyldpbld/EF7FZjqb4Zuhhve3xjnY3pwGre/oLmtVO0KfxH+u
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673884800"; 
   d="scan'208";a="338331050"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:39:06 +0800
IronPort-SDR: EGeno3kkBT2XyQo4btFAV964U3dmIU2jbBvFOSd2sPfa65DbrAJfQjPu/fvYt0llSAT5tZkH+8
 pfMf/DH8fYcamzbD0kGn6JZSh/q9o90rCCDr6WZ4sL3wrBte/SbzzoK8KggDeE9+fnnEiAOlV5
 gnxTkWfgAevY3jWciNqvUp8/cY/XCy1qCYxCpoODgVAzuacEHjsy/1UjchvCZAGsPUj4M2jpWA
 H/ATZPZiyFUOo6R2UzITj3kVp3qVavWKlMOobNNiF9v8zpgu/Oox219nF8i0zMzD+HcraIZPBH
 3gA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 15:49:42 -0700
IronPort-SDR: pCQtz3igi94HH16Q45yNmVfgUIirIN+d+JQkNAtaBBcHIXNFHORqWCQdEftGN/IaSGHwCM8JH8
 scQYd3JT8xHFpfy+zWKYSFgjKaa+45H1uVc0XVO8J6a+H9ub+OWcELwpqkivYDHynYOLJLmdZf
 keHYO8pou+bqPs9eT+BIR37GomMXE88ZrgoHmFSJMm/nxCShYYI2uDD+IR1TKWC7QV8ibk8BKi
 4zt7R1zHOO2Cfyo6OujL5Zz5UcXJzgc1TpsyBRtwXqQVjjmfnMh7/TeaJyUd2P/OOk6s28A2IW
 Sig=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 16:39:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PhlL14WCwz1RtVn
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 16:39:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679528345; x=1682120346; bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYW
	RoLzMsDk=; b=h9QS/6X7fJDm4CcTVHlExM/CvxKaQSHcJ3sMvlNeQIXATYROTa4
	ZSV+nLM79WCXq1AXsi8715n3y057dj2zZBTZOrGPgj9jkm1supLwusYWL+/prSZI
	mKf+YP1brVHXyAphtOar6qqhijH9KBR8i//9QjNisAvDcoaP8ZHx8+MfDD9yRlIq
	7KpzNJXuedKjhXsnAneHlHuEBq9aiR4Sv2avbjMPEZ/pxQHfL1Fnjv8S9jzQgYjO
	SRyztT4rEec+ORnjWXzFsMgcTgY8DXePtzO0bcTkiIX3hTkZboWSqZmd94itO88t
	SY88AkV3V1JB+53ucoVW86pRXi57DYvMVbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ntMf-3YzqbbC for <chrome-platform@lists.linux.dev>;
	Wed, 22 Mar 2023 16:39:05 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PhlKy5gVBz1RtVm;
	Wed, 22 Mar 2023 16:39:02 -0700 (PDT)
Message-ID: <1f963db6-5404-e483-69ac-fe8eaf5bb478@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:39:01 +0900
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230322173519.3971434-1-robh@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/23/23 02:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

